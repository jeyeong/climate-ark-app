import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';
import 'package:canvas/components/general/app_bar.dart';

import 'package:canvas/data.dart';
import 'package:canvas/components/homepage/summary_card.dart';

import 'package:canvas/data.dart';
import 'package:canvas/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CarbonAction> completedActions =
      getCompletedActions(fakeActions, fakeAccountData.actionsCompleted);

  @override
  Widget build(BuildContext context) {
    int carbonSaved = calculateCarbonSaved(completedActions);

    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 15),
<<<<<<< HEAD
        SummaryCard(
          carbonSaved: carbonSaved.toString(),
          streakDays: fakeAccountData.streak.toString(),
          actionsCompleted: completedActions.length.toString(),
=======
        const SummaryCard(
          carbonSaved: "500",
          streakDays: "7",
          actionsCompleted: "12",
>>>>>>> b78a02b (Completed summary card)
        ),
      ],
    ));
  }
}
