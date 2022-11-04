import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/login_page.dart';
import 'package:canvas/views/impact_page.dart';
import 'package:canvas/components/general/app_bar.dart';

import 'package:canvas/data.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late final List<Widget> _widgetOptions = <Widget>[
    HomePage(
      accountData: widget.accountData,
      actions: widget.actions,
    ),
    const Text(
      'Action',
      style: optionStyle,
    ),
    const ImpactPage(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Action',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Impact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryDarkestColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
