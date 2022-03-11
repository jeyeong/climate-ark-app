import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/login_page.dart';

class SignUpButton extends StatelessWidget {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: darkGreen,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  );

  SignUpButton({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text(
            'SIGNUP',
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