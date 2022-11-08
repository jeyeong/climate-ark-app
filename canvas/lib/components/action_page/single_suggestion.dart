import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class SingleSuggestion extends StatelessWidget {
  final String sugg;
  const SingleSuggestion({required this.sugg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 130.0,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: offsetWhite),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              sugg,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: offsetWhite),
            ),
          ),
        ));
  }
}
