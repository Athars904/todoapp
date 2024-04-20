import 'package:flutter/material.dart';
import 'package:todoapp/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (newValue) {
                taskData.updateTask(task);
              },
              onLongPressCallBack: (){
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
