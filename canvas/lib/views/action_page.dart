import 'package:canvas/components/action_page/suggestions_box.dart';
import 'package:flutter/material.dart';

import 'package:canvas/components/action_page/search_bar.dart';
import 'package:canvas/components/action_page/actions_card.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/data.dart';

class ActionPage extends StatefulWidget {
  final AccountData accountData;
  final List<CarbonAction> actions;

  const ActionPage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  String searchQuery = '';
  //String category = '';
  List<String> category = [];
  void updateSearchQuery(String newSearchQuery) {
    setState(() {
      searchQuery = newSearchQuery;
    });
  }

  void updateCategory(String newCategory) {
    setState(() {
      // if (newCategory == category) {
      //   category = '';
      // } else {
      //   category = newCategory;
      // }
      if (category.contains(newCategory)) {
        category.remove(newCategory);
      } else {
        category.add(newCategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /* Some function that filters actions to show based on search query and category filter. */
    late List<CarbonAction> actionsToShow = widget.actions;
    actionsToShow = category.isEmpty
        ? fakeActions
        : fakeActions.where((i) => category.contains(i.category)).toList();

    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.15 + 5,
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
                  Container(
                    child: SearchBar(
                      updateSearchQuery: updateSearchQuery,
                    ),
                  ),
                  Container(
                    // top: 20,
                    child: SuggestionBox(
                      updateCategory: updateCategory,
                    ),
                  ),
                ])),
        // const Positioned(child: ActionsCard()),

        Container(
            height: MediaQuery.of(context).size.height * 0.70 - 10,
            child: Material(
                child: ListView.builder(
                    itemCount: actionsToShow.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ActionsCard(
                        actionName: actionsToShow[index].actionName,
                        actionDescription:
                            actionsToShow[index].actionDescription,
                        actionType: actionsToShow[index].category,
                      );
                    }))),
      ],
    ))));
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
