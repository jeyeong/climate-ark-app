import 'package:canvas/views/landing_page.dart';
import 'package:flutter/material.dart';

import 'package:canvas/views/login_page.dart';
import 'package:canvas/views/landing_page.dart';
import 'package:canvas/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Climate Ark Canvas',
      home: MyHomePage(
        title: 'Janus (Canvas)',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color(0xFF09BC8A),
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            width: 500,
            height: 200,
            padding: const EdgeInsets.all(16.0),
            child: Text('Hi, John!',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white)),
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(
                width: 1.0,
                color: primaryDarkerColor,
              ),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
//              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomCenter, // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  primaryColor,
                  primaryDarkerColor
                ], // red to yellow
              ),
            ),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text(
                      '500kgs CO2 \nCarbon Saved',
                      style: TextStyle(fontSize: 25),
                    ),
                    margin: const EdgeInsets.all(4),
                  ),
//                  const CircleWithText(
//                    title: '4',
//                    radius: 50.0,
//                  ),
                ]),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.emoji_people,
                color: Colors.teal,
              ),
              title: Text('7 days   12 Activities Completed',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  )),
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.all(10.0),
              width: 500.0,
              height: 40.0,
              child: const Text('Some Activities for You',
                  style: TextStyle(
                    fontSize: 30.0,
                  ))),
        ]),
      ),
    );
  }
}
