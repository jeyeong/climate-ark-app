import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: litems.length,
        itemBuilder: (BuildContext context, int index){  
        return Column(
        children: <Widget>[
          Container(
            height: 50.0,
          ),
          CheckboxListTile(
          title: Text(litems[index].tasktitle),
          subtitle: Text(litems[index].tasksub),
          tileColor: const Color(0xFF84ddc4),
          checkColor: Color(0xFFFFFFFF),
          activeColor: Color(0xFF045e45),
          value: litems[index].isComplete,
          onChanged: (bool? value) {
            setState(() {
              litems[index].isComplete = value!;
            });
          },
          secondary: litems[index].taskicon,
        ),
        ],
      );
      }),
    );
  }
}

List<Task> litems = [
  Task(tasktitle: 'Change Laptop settings',
  tasksub: 'Ensuring that your computers and monitors are turned off',
  taskicon: const Icon(Icons.laptop)),
  Task(tasktitle: 'Carpooling',
  tasksub: 'Instead of driving solo, carpool and save money & the planet',
  taskicon: const Icon(Icons.car_repair)),
  Task(tasktitle: 'Carpooling',
  tasksub: 'Instead of driving solo, carpool and save money & the planet',
  taskicon: const Icon(Icons.car_repair))
];
