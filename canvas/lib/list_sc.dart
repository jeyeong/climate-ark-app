// ignore_for_file: equal_elements_in_set

import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';
import 'package:canvas/constants.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double ht = 230.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 130),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: TaskBrain.currList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF09bc8a)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    child: ExpansionTile(
                      title: Text(TaskBrain.currList[index].tasktitle),
                      subtitle: Text(TaskBrain.currList[index].tasksub),
                      leading: Container(
                          height: ht,
                          width: 100.0,
                          child: Image.asset(
                            TaskBrain.currList[index].imageicon,
                            fit: BoxFit.cover,
                          )),
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CheckboxListTile(
                            tileColor: Color(0xFF09bc8a),
                            title: Text(
                              '(TODO: having trouble putting this & stuff below in a Row widget!)',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            checkColor: Colors.white,
                            //fillColor: Color(0xFF045e45),
                            value: TaskBrain.currList[index].isComplete,
                            onChanged: (bool? value) {
                              setState(() {
                                TaskBrain.currList[index].isComplete = value!;
                              });
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 20.0),
                            color: Color(0xFF045e45),
                            child: Text(TaskBrain.currList[index].taskimpact),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 20.0),
                            color: Color(0xFFcdf1e7),
                            child: Text(TaskBrain.currList[index].dollarssaved),
                          ),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => ht = 600.0);
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
