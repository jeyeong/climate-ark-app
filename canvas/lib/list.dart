import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';
import 'package:canvas/constants.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
                  height: 20.0,
                ),
                //CheckboxListTile(
                // title: Text(TaskBrain.currList[index].tasktitle),
                // subtitle: Text(TaskBrain.currList[index].tasksub),
                // tileColor: const Color(0xFF84ddc4),
                // checkColor: Color(0xFFFFFFFF),
                // activeColor: Color(0xFF045e45),
                // value: TaskBrain.currList[index].isComplete,
                // onChanged: (bool? value) {
                //   setState(() {
                //     TaskBrain.currList[index].isComplete = value!;
                //   });
                // },
                // secondary: Container(
                //   height: 50,
                //   width: 50,
                //   child: Image.asset(
                //     TaskBrain.currList[index].imageicon,
                //     fit: BoxFit.cover,
                Container(
                  height: 70.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF09bc8a)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text(TaskBrain.currList[index].tasktitle),
                    subtitle: Text(TaskBrain.currList[index].tasksub),
                    tileColor: Color(0xFFFAFAFA),
                    checkColor: Color(0xFFFFFFFF),
                    activeColor: Color(0xFF045e45),
                    value: TaskBrain.currList[index].isComplete,
                    onChanged: (bool? value) {
                      setState(() {
                        TaskBrain.currList[index].isComplete = value!;
                      });
                    },
                    secondary: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        TaskBrain.currList[index].imageicon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

List<Task> litems = [
  Task(
      tasktitle: 'Change Laptop settings',
      tasksub: 'Ensuring that your computers and monitors are turned off',
      tasktype: 'Electricity',
      imageicon: 'assets/laptop.jpg',
      taskimpact: 5,
      dollarssaved: 10),
  Task(
      tasktitle: 'Change Laptop settings',
      tasksub: 'Ensuring that your computers and monitors are turned off',
      tasktype: 'Electricity',
      imageicon: 'assets/laptop.jpg',
      taskimpact: 5,
      dollarssaved: 10),
  Task(
      tasktitle: 'Carpooling',
      tasksub: 'Instead of driving solo, carpool and save money & the planet',
      tasktype: 'Emissions',
      imageicon: 'assets/carpool.jpg',
      taskimpact: 10,
      dollarssaved: 12)
];
