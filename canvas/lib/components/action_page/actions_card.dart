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
  }) : super(key: key);

  final CarbonAction action;

  @override
  State<ActionsCard> createState() => _ActionsCardState();
}

class _ActionsCardState extends State<ActionsCard> {
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
                      'assets/carpool.jpg',
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
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: primaryDarkColor,
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.check, color: primaryWhite),
                          title: const Text('Completed',
                              style: TextStyle(
                                  color: primaryWhite,
                                  fontWeight: FontWeight.bold)),
                          onTap: () {},
                        ))),
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
                      Text(" 24",
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
