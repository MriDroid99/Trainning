import 'package:flutter/material.dart';

// Model
import '../model/tasks.dart';

// Widget
import '../widget/task_widget.dart';

class TasksScreen extends StatelessWidget {
  final Function onChange;
  final List<Task> _tasks;
  const TasksScreen(this._tasks, this.onChange, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) => TaskWidget(
              _tasks[index].id,
              _tasks[index].title,
              _tasks[index].date,
              _tasks[index].status,
              onChange,
            ),
        separatorBuilder: (ctx, index) => Divider(
              thickness: 2,
              height: 0,
            ),
        itemCount: _tasks.length);
  }
}
