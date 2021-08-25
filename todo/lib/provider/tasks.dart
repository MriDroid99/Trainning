import 'package:flutter/material.dart';

enum Status { InProgress, Completed }

class Task {
  String id, title;
  DateTime date;
  TimeOfDay time;
  Status? status;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    this.status,
  });
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task(id: '1', title: 'Task1', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: '2', title: 'Task2', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: '3', title: 'Task3', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: '4', title: 'Task4', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: '5', title: 'Task5', date: DateTime.now(), time: TimeOfDay.now()),
  ];

  List<Task> filterTasks({Status? status}) {
    return _tasks.where((element) => element.status == status).toList();
  }

  void addTask(
    String title,
    DateTime date,
    TimeOfDay time,
  ) {
    _tasks.add(
      Task(
        id: DateTime.now().toString(),
        title: title,
        date: date,
        time: time,
      ),
    );
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    print(_tasks.length);
    notifyListeners();
  }

  void changeStatus(String id, Status status) {
    _tasks.firstWhere((element) => element.id == id).status = status;
    notifyListeners();
  }
}
