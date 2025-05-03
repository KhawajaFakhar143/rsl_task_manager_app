class TaskModel {
  String id;
  String title;
  String description;
  DateTime? startDateTime;
  DateTime? stopDateTime;
  bool completed;
  String priorty;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priorty,
    required this.startDateTime,
    required this.stopDateTime,
    this.completed = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priorty': priorty,
      'description': description,
      'completed': completed,
      'startDateTime': startDateTime?.toIso8601String(),
      'stopDateTime': stopDateTime?.toIso8601String(),
    };
  }


  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      priorty: json['priorty'],
      description: json['description'],
      completed: json['completed'],
      startDateTime: DateTime.parse(json['startDateTime']),
      stopDateTime: DateTime.parse(json['stopDateTime']),
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, priorty: $priorty, description: $description, '
        'startDateTime: $startDateTime, stopDateTime: $stopDateTime, '
        'completed: $completed}';
  }
}
