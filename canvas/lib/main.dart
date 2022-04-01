import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:canvas/search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: offsetWhite,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
              child: MyStatefulWidget(),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){  
        return Column(
        children: <Widget>[CheckboxListTile(
          title: const Text('Change Laptop Settings'),
          subtitle: const Text('Ensuring that your computers and monitors are turned off'),
          tileColor: const Color(0xFF84ddc4),
          checkColor: Color(0xFFFFFFFF),
          activeColor: Color(0xFF045e45),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
          secondary: const Icon(Icons.laptop),
        ),
        ],
      );
      }),
    );
  }
}

