import 'package:flutter/material.dart';
import 'package:canvas/views/login_page.dart';
import 'package:canvas/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Climate Ark Canvas',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const LoginPage(),
    );
  }
}
