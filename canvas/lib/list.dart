import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 130),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //       itemCount: litems.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Column(
  //           children: <Widget>[
  //             Container(
  //               height: 50.0,
  //             ),
  //             CheckboxListTile(
  //               title: Text(litems[index].tasktitle),
  //               subtitle: Text(litems[index].tasksub),
  //               tileColor: const Color(0xFF84ddc4),
  //               checkColor: Color(0xFFFFFFFF),
  //               activeColor: Color(0xFF045e45),
  //               value: litems[index].isComplete,
  //               onChanged: (bool? value) {
  //                 setState(() {
  //                   litems[index].isComplete = value!;
  //                 });
  //               },
  //               secondary: Container(
  //                 height: 50,
  //                 width: 50,
  //                 child: Image.asset(
  //                   litems[index].imageicon,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
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
