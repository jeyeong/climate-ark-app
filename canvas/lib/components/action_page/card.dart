import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return //Container(height: 100, width: 100, color: Colors.blueGrey);
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text('Hello World!'),
    );
  }
}
