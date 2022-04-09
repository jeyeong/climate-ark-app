import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';
import 'package:canvas/components/homepage/current_days.dart';

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
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: const Color(0xFF000000),
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
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Text(
                      'Streak Days',
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
              title: Text('Activities Completed 8',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
