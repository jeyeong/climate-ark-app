import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:collection';

class SuggestionBox extends StatefulWidget {
  const SuggestionBox({Key? key}) : super(key: key);

  @override
  State<SuggestionBox> createState() => _SuggestionBoxState();
}

class _SuggestionBoxState extends State<SuggestionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10),
                    width: 130.0,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: offsetWhite),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Plastic',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: offsetWhite),
                        ),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    width: 130.0,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: offsetWhite),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Water',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: offsetWhite),
                        ),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    width: 130.0,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: offsetWhite),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Household',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: offsetWhite),
                        ),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 130.0,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: offsetWhite),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        'Electricity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: offsetWhite),
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    width: 130.0,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: offsetWhite),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Transportation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: offsetWhite),
                        ),
                      ),
                    )),
              ],
            )));
  }
}
