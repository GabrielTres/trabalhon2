import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import '../viewmodels/project_provider.dart';
import '../views/edit_project_screen.dart';

class ProjectTile extends StatelessWidget {
  final Project project;

  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context, listen: false);

    return ListTile(
      title: Text(project.title),
      subtitle: Text(project.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditProjectScreen(project: project),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              projectProvider.deleteProject(project.id);
            },
          ),
        ],
      ),
    );
  }
}
