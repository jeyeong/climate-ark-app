import 'package:canvas/components/general/button.dart';
import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

import 'package:canvas/data.dart';

class ActionsCard extends StatefulWidget {
  const ActionsCard({
    Key? key,
    required this.action,
    required this.completed,
    required this.completedStamp,
    required this.addCompletedAction,
    required this.removeCompletedAction,
  }) : super(key: key);

  final CarbonAction action;
  final bool completed;
  final String completedStamp;
  final Function addCompletedAction;
  final Function removeCompletedAction;

  @override
  State<ActionsCard> createState() => _ActionsCardState();
}

class _ActionsCardState extends State<ActionsCard> {
  Container generateCompletedButton() {
    if (widget.completed) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: primaryDarkColor,
          ),
          child: ListTile(
            leading: const Icon(Icons.check, color: primaryLightColor),
            title: const Text('Completed',
                style: TextStyle(
                    color: primaryLightColor, fontWeight: FontWeight.bold)),
            onTap: () {
              widget.removeCompletedAction(widget.completedStamp);
            },
          ));
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color.fromARGB(255, 209, 244, 217),
        ),
        child: ListTile(
          leading: const Icon(Icons.check, color: primaryDarkColor),
          title: const Text('Complete',
              style: TextStyle(
                  color: primaryDarkColor, fontWeight: FontWeight.bold)),
          onTap: () {
            widget.addCompletedAction(widget.action.id);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.action.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      child: Text(
                        widget.action.actionName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black, // color of action header
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 300,
                      child: Text(widget.action.actionDescription,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey, // color of action header
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 7,
                  child: generateCompletedButton(),
                ),
                const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: primaryLightestColor,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      Icon(Icons.energy_savings_leaf_rounded,
                          color: primaryColor),
                      Text(widget.action.carbonScore.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primaryColor)),
                    ]),
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
