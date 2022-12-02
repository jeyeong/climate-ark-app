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
    required this.addCompletedAction,
    required this.removeCompletedAction,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;
  final Function addCompletedAction;
  final Function removeCompletedAction;

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  String searchQuery = '';
  List<String> category = [];

  void updateSearchQuery(String newSearchQuery) {
    setState(() {
      searchQuery = newSearchQuery;
    });
  }

  void updateCategory(String newCategory) {
    setState(() {
      if (category.contains(newCategory)) {
        category.remove(newCategory);
      } else {
        category.add(newCategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create map of action ID : stamp.
    Map<int, String> completionStampMap = Map.fromIterable(
      widget.accountData.actionsCompletedToday,
      key: (element) => element[1] as int,
      value: (element) => '${element[0].millisecondsSinceEpoch},${element[1]}',
    );

    /* Some function that filters actions to show based on search query and category filter. */
    late List<CarbonAction> actionsToShow = widget.actions
        .where((i) =>
            (category.isEmpty || category.contains(i.category)) &&
            (i.actionDescription
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                i.actionName.toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                SearchBar(
                  updateSearchQuery: updateSearchQuery,
                ),
                SuggestionBox(
                  updateCategory: updateCategory,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 225,
            child: ListView.builder(
              itemCount: actionsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                return ActionsCard(
                  action: actionsToShow[index],
                  completed:
                      completionStampMap.containsKey(actionsToShow[index].id),
                  completedStamp:
                      completionStampMap[actionsToShow[index].id] ?? '',
                  addCompletedAction: widget.addCompletedAction,
                  removeCompletedAction: widget.removeCompletedAction,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
