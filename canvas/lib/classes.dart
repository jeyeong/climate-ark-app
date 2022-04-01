import 'package:flutter/material.dart';

class Task {
  String tasktitle;
  String tasksub;
  bool isComplete;
  Icon taskicon;

  Task({required this.tasktitle, required this.tasksub, required this.taskicon, this.isComplete = false});
}

