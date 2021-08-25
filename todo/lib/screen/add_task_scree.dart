import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Provider
import '../provider/tasks.dart';

class AddTaskScreen extends StatefulWidget {
  static const routeName = '/add_task_screen';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var _titleController = TextEditingController();
  var _timeController = TextEditingController();
  var _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Time',
              ),
              readOnly: true,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) => setState(
                    () => _timeController.text = value?.format(context) ?? '',
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
              ),
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 7),
                  ),
                ).then(
                  (value) => setState(() => _dateController.text =
                      DateFormat.yMMMd().format(value ?? DateTime.now())),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Tasks>(context, listen: false).addTask(
                    _titleController.text,
                    DateFormat('yMMMd').parse(_dateController.text),
                    TimeOfDay(
                      hour: int.parse(_timeController.text.split(":")[0]),
                      minute: int.parse(
                          _timeController.text.split(":").join().split(' ')[0]),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text('Add Task'))
          ],
        ),
      ),
    );
  }
}
