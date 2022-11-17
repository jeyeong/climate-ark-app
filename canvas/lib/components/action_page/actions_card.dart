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
      height: 400,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      //child: Container(height: 50, width: 50, color: primaryColor),

      //child: Column(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Padding(
              //padding: const EdgeInsets.all(8.0),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/carpool.jpg',
                      height: 200,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              //),
              // Expanded, with its flex property, is used to "fill out the
              // rest of the space" in the row.
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Flexible is used to wrap text when it is too long.
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 300,
                      child: Text(
                        widget.action.actionName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey, // color of action header
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 300,
                      child: Text(
                        widget.action.actionDescription,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 65,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 75,
                    width: 400,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Completed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white, // color of action header
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 35,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 60,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: primaryLightestColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 60,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: primaryDarkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
