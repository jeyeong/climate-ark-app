import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/history_item.dart';

class HistoryListCard extends StatelessWidget {
  HistoryListCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 235,
        child: Material(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InfoCard(
                      text: data[index][0],
                      points: data[index][1],
                      height: 50.0,
                      dates: data[index][2]);
                })));
  }

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
