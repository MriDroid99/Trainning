import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  List<Task> _tasks = [];

  List<Task> filterTasks({Status? status}) {
    return _tasks.where((element) => element.status == status).toList();
  }

  Future<void> getData() async {
    var url =
        Uri.parse('https://todotrain-default-rtdb.firebaseio.com/tasks.json');
    var response = await http.get(url);
    var extractedData = json.decode(response.body) as Map<String, dynamic>;
    _tasks = [];
    extractedData.forEach((id, data) {
      String time = data['time'].substring(10, 15);
      _tasks.add(
        Task(
          id: id,
          title: data['title'],
          date: DateTime.parse(data['date']),
          time: TimeOfDay(
            hour: int.parse(time.split(':')[0]),
            minute: int.parse(
              time.split(':')[1],
            ),
          ),
          status: convertToStatus(
            data['status'],
          ),
        ),
      );
    });
  }

  Future<void> addTask(
    String title,
    DateTime date,
    TimeOfDay time,
  ) async {
    var url =
        Uri.parse('https://todotrain-default-rtdb.firebaseio.com/tasks.json');
    await http.post(
      url,
      body: json.encode(
        {
          'title': title,
          'date': date.toString(),
          'time': time.toString(),
        },
      ),
    );
    notifyListeners();
  }

  Future<void> removeTask(String id) async {
    var url = Uri.parse(
        'https://todotrain-default-rtdb.firebaseio.com/tasks/$id.json');
    await http.delete(url);
    notifyListeners();
  }

  Future<void> changeStatus(String id, Status status) async {
    var url = Uri.parse(
        'https://todotrain-default-rtdb.firebaseio.com/tasks/$id.json');
    await http.put(url,
        body: json.encode({
          'status': convertFromStatus(status),
        }));
    _tasks.firstWhere((element) => element.id == id).status = status;
    notifyListeners();
  }
}

String convertFromStatus(Status status) {
  if (status == Status.Completed) {
    return 'Completed';
  }
  return 'In Progress';
}

Status? convertToStatus(String? status) {
  if (status == 'Completed') {
    return Status.Completed;
  } else if (status == 'In Progress') {
    return Status.InProgress;
  } else {
    return null;
  }
}
