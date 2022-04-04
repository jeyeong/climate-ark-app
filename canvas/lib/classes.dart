import 'package:flutter/material.dart';

class Task {
  String tasktitle;
  String tasksub;
  String tasktype;
  bool isComplete;
  Icon taskicon;

  Task({required this.tasktitle, required this.tasksub, required this.tasktype, 
        required this.taskicon, this.isComplete = false});
}

