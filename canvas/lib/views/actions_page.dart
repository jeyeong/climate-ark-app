import 'package:flutter/material.dart';
import 'package:canvas/searchbar.dart';
import 'package:canvas/list.dart';
import 'package:canvas/filter.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Home(),
          const SearchBarUI(),
          MyStatefulWidget(),
        ],
      ),
    );
  }
}

class ActionCards extends StatelessWidget {
  const ActionCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}
