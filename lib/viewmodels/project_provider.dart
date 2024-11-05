import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';

class ProjectProvider with ChangeNotifier {
  final List<Project> _projects = [];
  final CollectionReference projectsRef = FirebaseFirestore.instance.collection('projects');

  List<Project> get projects => _projects;

  Future<void> fetchProjects() async {
    final snapshot = await projectsRef.get();
    _projects.clear();
    for (var doc in snapshot.docs) {
      _projects.add(Project.fromMap(doc.data() as Map<String, dynamic>, doc.id));
    }
    notifyListeners();
  }

  Future<void> addProject(Project project) async {
    final docRef = await projectsRef.add(project.toMap());
    project.id = docRef.id;
    _projects.add(project);
    notifyListeners();
  }

  Future<void> updateProject(Project project) async {
    await projectsRef.doc(project.id).update(project.toMap());
    int index = _projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      _projects[index] = project;
    }
    notifyListeners();
  }

  Future<void> deleteProject(String id) async {
    await projectsRef.doc(id).delete();
    _projects.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
