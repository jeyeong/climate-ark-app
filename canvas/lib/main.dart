import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.bolt,
                color: Colors.teal,
              ),
              title: Text('Streak Days 4',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  )),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
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
