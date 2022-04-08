import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class ActionItem extends StatefulWidget {
  const ActionItem({Key? key}) : super(key: key);

  @override
  _ActionItemState createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              CheckboxListTile(
                title: const Text('Change Laptop Settings'),
                subtitle: const Text(
                    'Ensuring that your computers and monitors are turned off'),
                tileColor: primaryLightestColor,
                checkColor: primaryWhite,
                activeColor: primaryDarkColor,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(
                    () {
                      isChecked = value!;
                    },
                  );
                },
                secondary: const Icon(Icons.laptop),
              ),
            ],
          );
        },
      ),
    );
  }
}
