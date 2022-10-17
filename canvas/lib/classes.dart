import 'package:flutter/material.dart';

class Task {
  String tasktitle;
  String tasksub;
  String tasktype;
  bool isComplete;
  String imageicon;
  int taskimpact;
  int dollarssaved;

  Task(
      {required this.tasktitle,
      required this.tasksub,
      required this.tasktype,
      required this.imageicon,
      this.isComplete = false,
      required this.taskimpact,
      required this.dollarssaved});
}
