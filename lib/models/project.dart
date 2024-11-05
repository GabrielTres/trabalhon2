class Project {
  String id;
  String title;
  String description;
  String status;

  Project({required this.id, required this.title, required this.description, required this.status});

  // Converte um documento Firestore para um Project
  factory Project.fromMap(Map<String, dynamic> data, String documentId) {
    return Project(
      id: documentId,
      title: data['title'],
      description: data['description'],
      status: data['status'],
    );
  }

  // Converte um Project para um Map para armazenar no Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
