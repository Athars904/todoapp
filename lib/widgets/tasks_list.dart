import 'package:flutter/material.dart';
import 'package:todoapp/widgets/tasks_tile.dart';
import 'package:todoapp/models/tasks.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList({required this.tasks});
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkBoxCallBack: (newValue) {
            setState(() {
              task.toggleDone();
            });
          },
        );
      },
    );
  }
}
