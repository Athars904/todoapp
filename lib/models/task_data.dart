import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/models/tasks.dart';
import 'package:flutter/foundation.dart';
class TaskData extends ChangeNotifier
{
  final List<Task> _tasks = [
    Task(name: 'Buy eggs'),
    Task(name: 'do sex'),
    Task(name: 'smash shit out of everyone')
  ];
  UnmodifiableListView <Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  int taskCount()
  {
    return _tasks.length;
  }
  void addTask(String newTaskTitle)
  {
    final task=Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
  void updateTask(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task)
  {
    _tasks.remove(task);
    notifyListeners();
  }
}