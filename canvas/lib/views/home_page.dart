import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/summary_card.dart';

import 'package:canvas/data.dart';
import 'package:canvas/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        SummaryCard(
          carbonSaved: carbonSaved.toString(),
          streakDays: fakeAccountData.streak.toString(),
          actionsCompleted: completedActions.length.toString(),
        ),
      ],
    ));
  }
}
