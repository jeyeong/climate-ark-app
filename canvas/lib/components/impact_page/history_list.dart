import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/history_item.dart';
import '../../data.dart';
import '../../utils/utils.dart';

class HistoryListCard extends StatelessWidget {
  HistoryListCard({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);
  final AccountData accountData;
  final List<CarbonAction> actions;
  @override
  Widget build(BuildContext context) {
    List<int> IDsOfCompletedActions = accountData.actionsCompleted
        .map((List<Object> action) => action[1] as int)
        .toList();

    // Get completed actions.
    List<CarbonAction> completedActions = getCompletedActions(
      actions,
      IDsOfCompletedActions,
    );

    List<List<String>> data2 = [];
    accountData.actionsCompleted.asMap().forEach((i, elem) {
      DateTime date = elem[0] as DateTime;
      String dateStr = date.day.toString() + "\n" + months[date.month - 1];
      String actionName = completedActions[i].actionName;
      String score = "+" + completedActions[i].carbonScore.toString();
      data2.add([actionName, score, dateStr]);
    });
    data2 = data2.reversed.toList();

    return Container(
        width: double.infinity,
        height: 235,
        child: Material(
            child: ListView.builder(
                itemCount: data2.length,
                itemBuilder: (BuildContext context, int index) {
                  return InfoCard(
                      text: data2[index][0],
                      points: data2[index][1],
                      height: 50.0,
                      dates: data2[index][2]);
                })));
  }

  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  List<List<String>> data = const [
    ["Change Laptop Settings", "+24", "17\nMAR"],
    ["Carpooling", "+43", "10\nMAR"],
    ["LED Light Bulbs", "+60", "23\nFEB"],
    ["Screen Time", "+20", "4\nJAN"],
    ["Change Laptop Settings", "+24", "17\nMAR"],
    ["Carpooling", "+43", "10\nMAR"],
    ["LED Light Bulbs", "+60", "23\nFEB"],
    ["Screen Time", "+20", "4\nJAN"],
  ];
}
