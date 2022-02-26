import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ListTile(leading: Icon(
                    Icons.laptop,
                    color: Colors.teal,
                    ),
                    title: 
                    Text('Change laptop settings',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 15.0),
                      ),
                      ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ListTile(leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                      ),
                      title: 
                      Text('shobs@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 15.0),
                        ),
                        ),
              ),
            )],
          ),
        ),
      ),
      );
  }
}


