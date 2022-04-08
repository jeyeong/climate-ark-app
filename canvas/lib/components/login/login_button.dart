import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/home_page.dart';

class LoginButton extends StatelessWidget {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: darkGreen,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
  );

  LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: buttonStyle,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text(
            'LOGIN',
            style: TextStyle(color: primaryWhite),
          ),
        ),
      ),
    );
  }
}

/*
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
*/