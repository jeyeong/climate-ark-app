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
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: <Widget>[
                //   GestureDetector(
                //     onTap: () {
                //       widget.updateCategory('Plastic');
                //     },
                //     child: SingleSuggestion(sugg: 'Plastic'),
                //   ),
                //   SingleSuggestion(sugg: 'Water'),
                //   SingleSuggestion(sugg: 'Household'),
                //   SingleSuggestion(sugg: 'Electricity'),
                //   SingleSuggestion(sugg: 'Transportation'),
                // ],
                children: [
                  for (var i in categories)
                    GestureDetector(
                        onTap: () {
                          widget.updateCategory(i);
                          // print(i);
                        },
                        child: SingleSuggestion(sugg: i))
                ])));
  }

  List<String> categories = const [
    "Plastic",
    "Water",
    "Household",
    "Electricity",
    "Transportation"
  ];
}
