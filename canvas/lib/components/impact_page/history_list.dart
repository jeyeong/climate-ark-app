import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/history_item.dart';

class HistoryListCard extends StatelessWidget {
  const HistoryListCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: <Widget>[
              InfoCard(
                text: "Change laptop setting",
                points: "+24",
                height: 100.0,
                dates: "17\nMAR",
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              InfoCard(
                text: "Carpooling",
                points: "+43",
                height: 100.0,
                dates: "10\nMAR",
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              InfoCard(
                text: "LED Light Bulbs",
                points: "+60",
                height: 100.0,
                dates: "23\nFEB",
              )
            ,
            ]);
          }));
    // return Scaffold(
    //   body: ListView(
    //       children: <Widget>[
    //         InfoCard(text: "Change laptop setting", points: "+24",  height:100.0, dates: "17\nMarch", ),
    //         InfoCard(text: "Carpooling", points: "+43",  height:100.0, dates: "10\nMarch", )
    //       ],
    //     ),
    // );
  }
}
