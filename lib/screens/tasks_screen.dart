import 'package:flutter/material.dart';
import 'package:todoapp/widgets/tasks_list.dart';
import 'package:todoapp/screens/add_tasks_screen.dart';
import 'package:todoapp/models/tasks.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key}); // Corrected the constructor

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'Buy eggs'),
    Task(name: 'do sex'),
    Task(name: 'smash shit out of everyone')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        splashColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AddTask(
            addTaskCallBack: (newTaskTitle) {
              setState(() {
                tasks.add(Task(name: newTaskTitle));
              });
            },
          ),
        );
      },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: TasksList(tasks: tasks), // Pass tasks through the constructor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
