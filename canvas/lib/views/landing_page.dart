import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/login_page.dart';
import 'package:canvas/views/impact_page.dart';
import 'package:canvas/components/general/app_bar.dart';
import 'package:canvas/views/action_page.dart';

import 'package:canvas/data.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const LoginPage(),
    HomePage(
      accountData: fakeAccountData,
      actions: fakeActions,
    ),
    ActionPage(
      accountData: fakeAccountData,
      actions: fakeActions,
    ),
    ImpactPage(
      accountData: fakeAccountData,
      actions: fakeActions,
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
      backgroundColor: primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: JanusAppBar(),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Action',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Impact',
            backgroundColor: Color(0xff08b184),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff012019),
        onTap: _onItemTapped,
      ),
    );
  }
}
