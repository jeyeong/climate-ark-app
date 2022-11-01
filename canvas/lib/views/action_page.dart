import 'package:canvas/components/action_page/suggestions_box.dart';
import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:canvas/components/action_page/search_bar.dart';
import 'package:canvas/components/action_page/actions_card.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //replace line 15 Stack with Column to see scrollable functionality
        body: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.15,
          //height: 110,
          width: double.infinity,
          //color: Colors.transparent,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          //SearchBar(),
          child: Column(children: [
            Positioned.fill(child: SearchBar()),
            Positioned(top: 20, child: SuggestionBox()),
            Positioned(child: ActionsCard()),
          ]))
    ]));
    // body: new Container(
    //     color: primaryColor,
    //     child: Column(children: [
    //       //SearchBar(),
    //       Positioned.fill(child: SearchBar()),
    //       Positioned(top: 60, child: SuggestionBox()),
    //       Positioned(child: ActionsCard())
    //     ]))
    //     );
  }
}
