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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text("500",
                                                style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            const Text(" Kgs CO2",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Carbon Saved",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      color: Colors.red,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ],
                                ),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      height: 20,
                                      width: 20,
                                    ),
                                    const Text("7",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const Text(" Days",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ))
                                  ],
                                ),
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      height: 25,
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Actions Completed",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("+3 This Week",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
        ],
      ),
    );
  }
}
