import 'package:canvas/components/general/button.dart';
import 'package:flutter/material.dart';
import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/login_page.dart';
import 'package:canvas/views/impact_page.dart';
import 'package:canvas/views/profile_page.dart';
import 'package:canvas/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Material(
            color: primaryDarkerColor,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                splashColor: primaryDarkestColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: primaryLightColor, width: 3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Ink.image(
                      image: AssetImage("assets/dummy.png"),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    )))));
  }
}

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
    HomePage(),
    Text(
      'Action',
      style: optionStyle,
    ),
    ImpactPage(),
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
        leading: const ProfilePic(),
        title: const Text(
          'J A N U S',
          style: TextStyle(
            color: Color(0xff62cfb2),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff08b184),
        centerTitle: true,
        elevation: 0,
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
