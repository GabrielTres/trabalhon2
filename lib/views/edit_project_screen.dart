import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import '../viewmodels/project_provider.dart';

class EditProjectScreen extends StatefulWidget {
  final Project project;

  const EditProjectScreen({Key? key, required this.project}) : super(key: key);

  @override
  _EditProjectScreenState createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late String status;

  @override
  void initState() {
    super.initState();
    title = widget.project.title;
    description = widget.project.description;
    status = widget.project.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Projeto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => description = value!,
              ),
              TextFormField(
                initialValue: status,
                decoration: InputDecoration(labelText: 'Status'),
                onSaved: (value) => status = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  final updatedProject = Project(
                    id: widget.project.id,
                    title: title,
                    description: description,
                    status: status,
                  );
                  Provider.of<ProjectProvider>(context, listen: false).updateProject(updatedProject);
                  Navigator.pop(context);
                },
                child: Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
