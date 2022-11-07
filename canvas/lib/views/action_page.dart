import 'package:canvas/components/action_page/suggestions_box.dart';
import 'package:flutter/material.dart';

import 'package:canvas/components/action_page/search_bar.dart';
import 'package:canvas/components/action_page/actions_card.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/data.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  late List<CarbonAction> actionsToShow = widget.actions;

  void updateActionsToShow(List<CarbonAction> filteredActions) {
    setState(() {
      actionsToShow = filteredActions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //replace line 15 Stack with Column to see scrollable functionality
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Positioned.fill(
                  child: SearchBar(
                    actions: widget.actions,
                    updateActionsToShow: updateActionsToShow,
                  ),
                ),
                const Positioned(top: 20, child: SuggestionBox()),
                const Positioned(child: ActionsCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ActionPage extends StatelessWidget {
//   const ActionPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //replace line 15 Stack with Column to see scrollable functionality
//         body: Column(children: [
//       Container(
//           height: MediaQuery.of(context).size.height * 0.15,
//           //height: 110,
//           width: double.infinity,
//           //color: Colors.transparent,
//           decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10.0),
//                   bottomRight: Radius.circular(10.0))),
//           //SearchBar(),
//           child: Column(children: [
//             Positioned.fill(child: SearchBar()),
//             Positioned(top: 20, child: SuggestionBox()),
//             Positioned(child: ActionsCard()),
//           ]))
//     ]));
//     // body: new Container(
//     //     color: primaryColor,
//     //     child: Column(children: [
//     //       //SearchBar(),
//     //       Positioned.fill(child: SearchBar()),
//     //       Positioned(top: 60, child: SuggestionBox()),
//     //       Positioned(child: ActionsCard())
//     //     ]))
//     //     );
//   }
// }
