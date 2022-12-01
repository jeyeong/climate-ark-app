import 'package:canvas/data.dart';
import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

import 'package:canvas/components/impact_page/action_card.dart';
import 'package:canvas/components/impact_page/streak_card.dart';

class StreakActionCard extends StatefulWidget {
  final int streakDays;
  final double boxHeight;
  final int numActionsCompleted;
  final int numActionsThisWeek;

  const StreakActionCard(
      {required this.streakDays,
      required this.numActionsCompleted,
      required this.numActionsThisWeek,
      required this.boxHeight,
      Key? key})
      : super(key: key);

  @override
  _StreakActionCardState createState() => _StreakActionCardState(
      streakDays: this.streakDays,
      numActionsCompleted: this.numActionsCompleted,
      numActionsThisWeek: this.numActionsThisWeek,
      boxHeight: this.boxHeight);
}

class _StreakActionCardState extends State<StreakActionCard> {
  int streakDays;
  double boxHeight;
  int numActionsCompleted;
  int numActionsThisWeek;
  _StreakActionCardState({
    required this.streakDays,
    required this.numActionsCompleted,
    required this.numActionsThisWeek,
    required this.boxHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreakCard(
              streakDays: streakDays,
              boxWidth: MediaQuery.of(context).size.width * 0.325,
              boxHeight: boxHeight),
          ActionCard(
            numActionsCompleted: numActionsCompleted,
            thisWeek: numActionsThisWeek,
            boxHeight: boxHeight,
            boxWidth: MediaQuery.of(context).size.width * 0.55,
          )
        ],
      ),
    );
  }
}
