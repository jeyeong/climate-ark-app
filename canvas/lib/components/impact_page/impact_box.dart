import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

import 'package:canvas/components/impact_page/graph_image.dart';
import 'package:canvas/components/impact_page/graph_toggle.dart';
import 'package:canvas/components/impact_page/history_list.dart';
import 'package:canvas/components/impact_page/history_item.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';

enum View { stats, history }

class ImpactBox extends StatefulWidget {
  const ImpactBox({Key? key}) : super(key: key);

  _ImpactBoxState createState() => _ImpactBoxState();
}

class _ImpactBoxState extends State<ImpactBox> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ToggleButtons(
              children: <Widget>[
                Text("Stats",
                    style: TextStyle(
                        fontSize: 20,
                        color: (isSelected[0] ? primaryWhite : primaryColor))),
                Text("History",
                    style: TextStyle(
                        fontSize: 20,
                        color: (isSelected[1] ? primaryWhite : primaryColor))),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
              constraints: BoxConstraints(
                  minHeight: 30.0,
                  maxHeight: 50.0,
                  minWidth: (MediaQuery.of(context).size.width - 40) / 2),
              color: offsetWhite,
              fillColor: primaryColor,
              borderColor: primaryColor,
              selectedBorderColor: primaryColor,
              borderRadius: BorderRadius.circular(8),
              borderWidth: 3,
            ),
            isSelected[0]
                ? GraphPack(passedType: Toggle.daily)
                : HistoryListCard(),
          ],
        ));
  }
}
