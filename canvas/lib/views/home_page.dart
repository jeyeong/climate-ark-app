import 'package:flutter/material.dart';
import 'package:canvas/components/homepage/circle_with_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Part below app bar
          Stack(
            children: [
              Container(
                height: 80.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Color(0xff08b184),
                ),
              ),
              Container(
                height: 140.0,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffe6e6e6),
                        spreadRadius: 0.25,
                        blurRadius: 0.5,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.green,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                color: Colors.amber,
                                height: 40,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 15,
                              child: Container(
                                color: Colors.blue,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Main content
          Container(
            margin: const EdgeInsets.only(
              top: 12.0,
              left: 15.0,
            ),
            child: const Text(
              'Some Activities For You',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
