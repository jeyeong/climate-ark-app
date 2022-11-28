import 'package:canvas/components/action_page/single_suggestion.dart';
import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class SuggestionBox extends StatefulWidget {
  const SuggestionBox({
    Key? key,
    required this.updateCategory,
  }) : super(key: key);

  final Function updateCategory;

  @override
  State<SuggestionBox> createState() => _SuggestionBoxState();
}

class _SuggestionBoxState extends State<SuggestionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
                    // [
                    //   for (var i in categories)
                    //     GestureDetector(
                    //         onTap: () {
                    //           widget.updateCategory(i);
                    //           // print(i);
                    //         },
                    //         child: SingleSuggestion(sugg: i))
                    // ]
                    [
              for (String key in categoryMap.keys)
                GestureDetector(
                    onTap: () {
                      widget.updateCategory(key);
                      categoryMap[key] = !categoryMap[key]!;
                      // print(i);
                    },
                    child: SingleSuggestion(
                      sugg: key,
                      isPressed: categoryMap[key]!,
                    ))
            ])));
  }

  List<String> categories = const [
    "Plastic",
    "Water",
    "Household",
    "Electronics",
    "Commute"
  ];
  var categoryMap = {
    "Plastic": false,
    "Water": false,
    "Household": false,
    "Electronics": false,
    "Commute": false,
  };
}
