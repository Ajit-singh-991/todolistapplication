import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Everything the user adds to the list is a task.
//Task provider is self explanatory and its job is being the provider for the project.

class Task {
  final String id;
  String adharCardNumber;
  String accountNumber;
  String panNumber;
  String name;
  
  bool isDone;

  Task({
    required this.id,
    required this.adharCardNumber,
    required this.accountNumber,
    required this.panNumber,
    required this.name,
    this.isDone = false,
  });
}

class TaskProvider with ChangeNotifier {
  List<Task> get itemsList {
    return _toDoList;
  }

  final List<Task> _toDoList = [
    Task(
      id: 'task#1',
      adharCardNumber:'987542136852',
      accountNumber: '012345678910',
      panNumber: 'GYPPS1234H',
      name: 'Ajit Singh'

    ),
    Task(
      id: 'task#2',
     adharCardNumber:'123456789123',
      accountNumber: '012345678910',
      panNumber: 'GYCCS1234H',
      name: 'Ajit Rathore'
    ),
  ];

  Task getById(String id) {
    return _toDoList.firstWhere((task) => task.id == id);
  }

  void createNewTask(Task task) {
    final newTask = Task(
      id: task.id,
      adharCardNumber: task.adharCardNumber,
      accountNumber: task.accountNumber,
      panNumber: task.panNumber,
      name: task.name
    );
    _toDoList.add(newTask);
    notifyListeners();
  }

  void editTask(Task task) {
    removeTask(task.id);
    createNewTask(task);
  }

  void removeTask(String id) {
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _toDoList.indexWhere((task) => task.id == id);
    _toDoList[index].isDone = !_toDoList[index].isDone;
    //print('PROVIDER ${_toDoList[index].isDone.toString()}');
  }
}
