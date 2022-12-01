import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class StreakCard extends StatefulWidget {
  final int streakDays;
  final double boxHeight;
  final double boxWidth;
  const StreakCard(
      {required this.streakDays,
      required this.boxHeight,
      required this.boxWidth,
      Key? key})
      : super(key: key);

  @override
  _StreakCardState createState() => _StreakCardState(
      streakDays: this.streakDays,
      boxHeight: this.boxHeight,
      boxWidth: boxWidth);
}

class _StreakCardState extends State<StreakCard> {
  int streakDays;
  double boxHeight;
  double boxWidth;
  _StreakCardState(
      {required this.streakDays,
      required this.boxHeight,
      required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: boxWidth,
        height: boxHeight,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        child: Row(children: [
          Image(
            image: AssetImage('assets/fire.png'),
            height: boxHeight - 10,
            width: boxHeight - 10,
          ),
          RichText(
            text: TextSpan(
              text: '',
              children: <TextSpan>[
                TextSpan(
                    text: streakDays.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryWhite,
                        fontFamily: 'Poppins')),
                TextSpan(
                    text: ' Days',
                    style: TextStyle(
                        fontSize: 15,
                        color: primaryWhite,
                        fontFamily: 'Poppins')),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Color(0xFFFFA08B), Color(0xFFFFD88C)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ));
  }
}
