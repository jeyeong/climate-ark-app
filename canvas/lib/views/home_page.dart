import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/summary_card.dart';
import 'package:canvas/components/homepage/home_page_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        Column(
          children: const [
            HomePageCard(),
            HomePageCard(),
            HomePageCard(),
          ],
        )
      ],
    ));
  }
}
