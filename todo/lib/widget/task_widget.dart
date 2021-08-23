import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../model/tasks.dart';

class TaskWidget extends StatelessWidget {
  final String id, title;
  final DateTime date;
  final Status? status;
  final Function onChange;
  const TaskWidget(this.id, this.title, this.date, this.status, this.onChange,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(title),
          // leading: CircleAvatar(
          //   child: Text('$date'),
          // ),
          subtitle: Text('${DateFormat.yMMMd().format(date)}'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print('4'),
        ),
        IconSlideAction(
          caption: 'In Progress',
          color: Colors.black45,
          icon: Icons.archive_outlined,
          onTap: () => onChange(id, Status.InProgress),
        ),
        IconSlideAction(
          caption: 'Completed',
          color: Colors.blue,
          icon: Icons.done_all,
          onTap: () => print('3'),
        ),
      ],
    );
  }
}
