import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class SuggestionBox extends StatefulWidget {
  const SuggestionBox({Key? key}) : super(key: key);

  @override
  State<SuggestionBox> createState() => _SuggestionBoxState();
}

class _SuggestionBoxState extends State<SuggestionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  width: 160.0,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  height: 100,
                  color: Colors.orange,
                ),
              ],
            )));
  }
}
