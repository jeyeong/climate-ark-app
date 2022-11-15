import 'package:flutter/material.dart';
import 'package:canvas/views/landing_page.dart';
import 'package:canvas/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const LandingPage(),
    );
  }
}
