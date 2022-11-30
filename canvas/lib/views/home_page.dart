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
  late List<int> IDsOfCompletedActions = widget
      .accountData.actionsCompletedToday
      .map((List<Object> action) => action[1] as int)
      .toList();

  late List<CarbonAction> completedActions = getCompletedActions(
    widget.actions,
    IDsOfCompletedActions,
  );

  late Map<int, String> completionStampMap = Map.fromIterable(
    widget.accountData.actionsCompletedToday,
    key: (element) => element[1] as int,
    value: (element) => '${element[0].millisecondsSinceEpoch},${element[1]}',
  );

  @override
  Widget build(BuildContext context) {
    double carbonSaved = calculateCarbonSaved(completedActions);

    // Think of how we want to filter out the actions to show.
    widget.actions
        .shuffle(); // display ordering of actions differently on renders
    List<CarbonAction> actionsToShow = widget.actions.sublist(0, 5);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xff08b184),
                //color: primaryWhite,
                //borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  child: (SummaryCard(
                    carbonSaved: carbonSaved.toString(),
                    streakDays: widget.accountData.streak.toString(),
                    actionsCompleted: completedActions.length.toString(),
                  )))),
          Container(
              margin: const EdgeInsets.only(left: 10.0, top: 10),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Some Activities For You",
                    style: TextStyle(fontSize: 25)),
              )),
          Container(
            height: 510,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actionsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                return HomePageCard(
                  action: actionsToShow[index],
                  completed:
                      completionStampMap.containsKey(actionsToShow[index].id),
                  completedStamp:
                      completionStampMap[actionsToShow[index].id] ?? '',
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
