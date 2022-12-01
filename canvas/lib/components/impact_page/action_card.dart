import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatefulWidget {
  final int numActionsCompleted;
  final int thisWeek;
  final double boxHeight;
  final double boxWidth;
  const ActionCard(
      {required this.numActionsCompleted,
      required this.thisWeek,
      required this.boxHeight,
      required this.boxWidth,
      Key? key})
      : super(key: key);

  @override
  _ActionCardState createState() => _ActionCardState(
      numActionsCompleted: this.numActionsCompleted,
      thisWeek: this.thisWeek,
      boxHeight: this.boxHeight,
      boxWidth: boxWidth);
}

class _ActionCardState extends State<ActionCard> {
  int numActionsCompleted;
  int thisWeek;
  double boxHeight;
  double boxWidth;

  _ActionCardState(
      {required this.numActionsCompleted,
      required this.thisWeek,
      required this.boxHeight,
      required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryLightestColor,
      ),
      child: Row(children: [
        Container(
            child: Center(
                child: Text(numActionsCompleted.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: primaryWhite,
                        fontFamily: 'Poppins'))),
            width: boxHeight - 15,
            height: boxHeight - 15,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff09bc8a),
            )),
        RichText(
          text: TextSpan(
            text: '',
            children: <TextSpan>[
              TextSpan(
                  text: 'Actions Completed\n',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff09bc8a),
                      fontFamily: 'Poppins')),
              TextSpan(
                  text: '+ ' + thisWeek.toString() + ' This Week',
                  style: TextStyle(
                      fontSize: 12, color: darkGrey, fontFamily: 'Poppins')),
            ],
          ),
        ),
      ]),
    );
  }
}
