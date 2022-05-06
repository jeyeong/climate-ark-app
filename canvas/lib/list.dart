import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';
import 'package:canvas/constants.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double ht = 130.0;
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
                  // child: CheckboxListTile(
                  //   title: Text(TaskBrain.currList[index].tasktitle),
                  //   subtitle: Text(TaskBrain.currList[index].tasksub),
                  //   tileColor: Color(0xFFFAFAFA),
                  //   checkColor: Color(0xFFFFFFFF),
                  //   activeColor: Color(0xFF045e45),
                  //   value: TaskBrain.currList[index].isComplete,
                  //   onChanged: (bool? value) {
                  //     setState(() {
                  //       TaskBrain.currList[index].isComplete = value!;
                  //     });
                  //   },
                  //   secondary: Container(
                  //     height: 50,
                  //     width: 50,
                  //     child: Image.asset(
                  //       TaskBrain.currList[index].imageicon,
                  //       fit: BoxFit.cover,
                  //     ),
                  child: Card(
                    child: ExpansionTile(
                      title: Text(TaskBrain.currList[index].tasktitle),
                      subtitle: Text(TaskBrain.currList[index].tasksub),
                      leading: Container(
                          height: ht,
                          width: 50,
                          child: Image.asset(
                            TaskBrain.currList[index].imageicon,
                            fit: BoxFit.cover,
                          )),
                      children: <Widget>[
                        Text('stuff 1'),
                        Text('stuff 2'),
                        Text('stuff 3'),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => ht = 300.0);
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
