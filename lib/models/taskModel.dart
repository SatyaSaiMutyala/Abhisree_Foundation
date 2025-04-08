
class Taskmodel {
  final int id;
  final String title;
  final String type;

  Taskmodel({
    required this.id,
    required this.title,
    required this.type,
  });

  factory Taskmodel.fromJson(Map<String, dynamic> json) {
    return Taskmodel(id: json['id'], title: json['title'], type: json['type']);
  }

}

