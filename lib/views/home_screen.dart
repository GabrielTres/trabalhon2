import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/project_provider.dart';
import '../widgets/project_tile.dart';
import 'add_project_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Projetos'),
      ),
      body: FutureBuilder(
        future: projectProvider.fetchProjects(),
        builder: (context, snapshot) {
          


          return ListView.builder(
            itemCount: projectProvider.projects.length,
            itemBuilder: (context, index) {
              return ProjectTile(project: projectProvider.projects[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddProjectScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
