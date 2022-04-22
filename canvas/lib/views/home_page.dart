import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  const CircleWithText(
                    title: '4',
                    radius: 50.0,
                  ),
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
