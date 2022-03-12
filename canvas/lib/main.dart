import 'package:canvas/components/info_card.dart';
import 'package:flutter/material.dart';
//import 'package:canvas/constants.dart';
import 'package:canvas/components/footprint_card.dart';



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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              InfoCard(text: "Streak Days", days: "4",  height:100.0, icon: Icon(Icons.flash_on),),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Expanded(
                  child: FootprintCard(toptext: "Total Carbon \nfootprint offsetted", circletext:'500 Kgs', radius:100.0),),
                Expanded(
                  child: FootprintCard(toptext:"Average human\nfootprint",circletext:'950\nKgs', radius:50.0),),
                // Expanded(
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
