import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import '../viewmodels/project_provider.dart';

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Projeto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => description = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                onSaved: (value) => status = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Provider.of<ProjectProvider>(context, listen: false).addProject(
                    Project(id: '', title: title, description: description, status: status),
                  );
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
