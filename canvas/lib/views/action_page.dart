import 'package:canvas/components/action_page/suggestions_box.dart';
import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:canvas/components/action_page/search_bar.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //replace line 15 Stack with Column to see scrollable functionality
        child: Column(children: [
      //SearchBar(),
      Positioned.fill(child: SearchBar()),
      Positioned(top: 60, child: SuggestionBox()),
      //Positioned.fill(child: SearchBar()),
    ]));
  }
}
