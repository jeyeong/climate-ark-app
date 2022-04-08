import 'package:canvas/views/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:canvas/views/login_page.dart';
import 'package:canvas/views/landing_page.dart';
import 'package:canvas/constants.dart';

void main() {
  runApp(const MyApp());
}

void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Climate Ark Canvas',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const LandingPage(),
    );
  }
}

