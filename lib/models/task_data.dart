import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:to_do/models/task.dart';

class TaskData extends ChangeNotifier {
  //Listens for changes
  List<Task> _tasks = [
    Task(name: 'Go to gym'),
    Task(name: 'Buy Mango'),
    Task(name: 'Buy Apple'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
