import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class ActionsCard extends StatefulWidget {
  const ActionsCard({Key? key}) : super(key: key);

  @override
  State<ActionsCard> createState() => _ActionsCardState();
}

class _ActionsCardState extends State<ActionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Image.asset('assets/carpool.jpg'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Carpooling',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey)),
              Text(
                  'Instead of driving solo, carpool & save some money & the planet :)')
            ],
          ),
        ],
      ),
    );
  }
}
