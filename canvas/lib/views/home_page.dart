import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';
import 'package:canvas/components/general/app_bar.dart';

import 'package:canvas/data.dart';
import 'package:canvas/components/homepage/summary_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 15),
        const SummaryCard(
          carbonSaved: "500",
          streakDays: "7",
          actionsCompleted: "12",
        ),
      ],
    ));
  }
}
