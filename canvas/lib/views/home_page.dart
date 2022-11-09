import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';

import 'package:canvas/data.dart';
import 'package:canvas/components/homepage/summary_card.dart';
import 'package:canvas/components/homepage/home_page_card.dart';

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
  late List<CarbonAction> completedActions = getCompletedActions(
    widget.actions,
    widget.accountData.actionsCompleted,
  );

  @override
  Widget build(BuildContext context) {
    int carbonSaved = calculateCarbonSaved(completedActions);

    // Think of how we want to filter out the actions to show.
    List<CarbonAction> actionsToShow = widget.actions.sublist(0, 3);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          SummaryCard(
            carbonSaved: carbonSaved.toString(),
            streakDays: fakeAccountData.streak.toString(),
            actionsCompleted: completedActions.length.toString(),
          ),
          Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actionsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                return HomePageCard(
                  action: actionsToShow[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
