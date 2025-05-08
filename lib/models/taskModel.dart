class TaskModel {
  final int id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String role;

  TaskModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'role':role,
    };
  }
}
