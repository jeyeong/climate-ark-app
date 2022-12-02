import 'package:canvas/components/impact_page/action_card.dart';
import 'package:canvas/components/impact_page/streak_action_card.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/impact_box.dart';
import 'package:canvas/components/impact_page/fun_fact.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/data.dart';
import '../utils/utils.dart';

import '../components/impact_page/streak_card.dart';

class ImpactPage extends StatefulWidget {
  const ImpactPage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;

  @override
  State<ImpactPage> createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> {
  @override
  Widget build(BuildContext context) {
    List<List<Object>> actionsCompleted = widget.accountData.actionsCompleted;
    late AccountData thisAccountInfo = widget.accountData;

    List<int> IDsOfCompletedActions = widget.accountData.actionsCompleted
        .map((List<Object> action) => action[1] as int)
        .toList();

    DateTime now = DateTime.now();
    int currentDay = now.weekday;
    DateTime firstDayOfWeek = now.subtract(Duration(days: currentDay));
    List<List<Object>> thisWeek = actionsCompleted.where((i) {
      DateTime dayInfo = i[0] as DateTime;
      return dayInfo.day >= firstDayOfWeek.day &&
          dayInfo.month == firstDayOfWeek.month &&
          dayInfo.year == firstDayOfWeek.year;
    }).toList();

    // Get completed actions.
    List<CarbonAction> completedActions = getCompletedActions(
      widget.actions,
      IDsOfCompletedActions,
    );
    double carbonSaved = calculateCarbonSaved(completedActions);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff08b184),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const LeafBox(numSaved: 70, size: 110),
                Text.rich(TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                        text: carbonSaved.toString() + ' ',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                    const TextSpan(
                        text: 'Kgs CO',
                        style: TextStyle(
                            fontSize: 20,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                    const TextSpan(
                        text: '2',
                        style: TextStyle(
                            fontSize: 10,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                  ],
                )),
                const Text("Carbon Saved",
                    style: TextStyle(
                        fontSize: 15,
                        color: primaryWhite,
                        fontFamily: "Poppins")),
                FunFact(
                    text:
                        "Going great! You saved emissions worth\n a flight between Delhi and Banglore",
                    height: 70.0,
                    icon: const Icon(Icons.airplanemode_on),
                    col: primaryLighterColor),
              ],
            ),
          ),
          Container(
            child: Column(children: [
              StreakActionCard(
                streakDays: thisAccountInfo.streak,
                numActionsCompleted: completedActions.length,
                numActionsThisWeek: thisWeek.length,
                boxHeight: 50,
              ),
              ImpactBox(accountData: thisAccountInfo, actions: widget.actions),
            ]),
          ),
        ],
      ),
    ))));
  }
}
