import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

import 'package:canvas/data.dart';

class ActionsCard extends StatefulWidget {
  const ActionsCard({
    Key? key,
    required this.action,
  }) : super(key: key);

  final CarbonAction action;

  @override
  State<ActionsCard> createState() => _ActionsCardState();
}

class _ActionsCardState extends State<ActionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Image.asset('assets/carpool.jpg'),
          // Expanded, with its flex property, is used to "fill out the
          // rest of the space" in the row.
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flexible is used to wrap text when it is too long.
                Flexible(
                  child: Text(
                    widget.action.actionName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.action.actionDescription,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
