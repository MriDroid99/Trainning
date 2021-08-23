enum Status { InProgress, Completed }

class Task {
  String id, title;
  DateTime date;
  Status? status;

  Task({
    required this.id,
    required this.title,
    required this.date,
    this.status,
  });
}
