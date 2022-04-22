import 'package:flutter/material.dart';


class Task {
  String tasktitle;
  String tasksub;
  String tasktype;
  bool isComplete;
  String imageicon;
  int taskimpact;
  int dollarssaved;

  Task({required this.tasktitle, required this.tasksub, required this.tasktype, 
        required this.imageicon, this.isComplete = false, required this.taskimpact,
        required this.dollarssaved});
}

class TaskBrain {

  static List<Task> litems = [
    Task(
        tasktitle: 'Change Laptop settings',
        tasksub: 'Ensuring that your computers and monitors are turned off',
        tasktype: 'Electricity',
        imageicon: 'assets/laptop.jpg',
        taskimpact: 5,
        dollarssaved: 10),
    Task(
        tasktitle: 'Change Laptop settings',
        tasksub: 'Ensuring that your computers and monitors are turned off',
        tasktype: 'Electricity',
        imageicon: 'assets/laptop.jpg',
        taskimpact: 5,
        dollarssaved: 10),
    Task(
        tasktitle: 'Carpooling',
        tasksub: 'Instead of driving solo, carpool and save money & the planet',
        tasktype: 'Emissions',
        imageicon: 'assets/carpool.jpg',
        taskimpact: 10,
        dollarssaved: 12)
  ];

  static List<Task> currList = litems;

  static void filterbyType({String filt=''}){

    Iterable<Task> filteredList = litems.where((task) => task.tasktype==filt);
    currList = filteredList.toList();

  }

  static void resetList(){
    currList = litems;
  }

  
}