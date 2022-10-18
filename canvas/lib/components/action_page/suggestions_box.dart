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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 160.0,
                  height: 50,
                  color: Colors.grey[400],
                  child: Center(
                    child: Text(
                      'Plastic',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Water',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Household',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 50,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Electricity',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 50,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Transportation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )));
  }
}
