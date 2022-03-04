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
        child: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: const Color(0xFF000000),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              // check out expanded!!!
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text("Total Carbon \nfootprint offsetted",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, ),
                    textAlign: TextAlign.center,
                      ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.black, width: 3.0))
                      ),
                      child: Center(
                        child: const Text('500 Kgs', 
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,), 
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Average human\nfootprint",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, ),
                    textAlign: TextAlign.center,
                    ),  
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.black, width: 3.0))
                      ),
                      child: Center(
                        child: const Text('950\nKgs', 
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ), 
                      )
                    )
                  ]
                  
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
