import 'package:canvas/components/impact_page/graph_image.dart';
import 'package:canvas/components/impact_page/graph_toggle.dart';
import 'package:canvas/components/impact_page/history_list.dart';
import 'package:canvas/components/impact_page/history_item.dart';


import 'package:canvas/constants.dart';

import 'package:flutter/material.dart';

enum View {stats, history}

class ImpactBox extends StatefulWidget {
  const ImpactBox({Key? key}) : super(key: key);

  _ImpactBoxState createState() => _ImpactBoxState();
}

class _ImpactBoxState extends State<ImpactBox> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ToggleButtons(
            children: const <Widget>[
              // Text("Stats", style: TextStyle(
              //   color : (isSelected[0] ? primaryWhite : primaryColor ))
              //   ),
              Text("Stats"),
              Text("History"),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelected,
            constraints: BoxConstraints(minHeight: 50.0, maxHeight: 80.0, minWidth: 100.0, maxWidth: 200.0),
            color: primaryColor,

          ),
          isSelected[0] ? GraphPack(passedType: Toggle.daily) : Expanded(child: HistoryListCard()),

        ],
        )

    );
    
    
    // MaterialApp(
    //   title: _title,
    //   home: Scaffold(
    //     appBar: AppBar(title: const Text(_title)),
    //     body: const Center(
    //       child: MyStatefulWidget(),
    //     ),
    //   ),
    // );
  }
}


