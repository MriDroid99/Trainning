import 'package:flutter/material.dart';

// Model
import '../model/tasks.dart';

// Screen
import './tasks_screen.dart';
import './in_progress_screen.dart';
import './completed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;
  List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Task1',
      date: DateTime.now(),
    ),
    Task(
      id: '2',
      title: 'Task2',
      date: DateTime.now(),
    ),
  ];

  void changeStatus(String id, Status status) {
    setState(() {
      _tasks.firstWhere((element) => element.id == id).status = status;
    });
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Task> filterTasks({Status? status}) {
    return _tasks.where((element) => element.status == status).toList();
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Tasks',
        'page': TasksScreen(filterTasks(), changeStatus),
      },
      {
        'title': 'InProgress',
        'page': InProgressScreen(
            filterTasks(status: Status.InProgress), changeStatus),
      },
      {
        'title': 'Completed',
        'page': CompletedScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
      ),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changePage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Taks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
