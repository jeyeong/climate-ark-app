import 'package:flutter/material.dart';

import 'package:canvas/views/login_page.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//     );
//   }
// }

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LoginPage(),
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Action',
      style: optionStyle,
    ),
    Text(
      'Impact',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Climate Ark Janus'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
            backgroundColor: Colors.lime,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lime,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Action',
            backgroundColor: Colors.lime,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Impact',
            backgroundColor: Colors.lime,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
