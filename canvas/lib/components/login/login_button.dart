import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class LoginButton extends StatelessWidget {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: darkGreen,
    padding: const EdgeInsets.symmetric(vertical: 22.5, horizontal: 40),
  );

  LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: buttonStyle,
          onPressed: () {},
          child: const Text(
            'LOGIN',
            style: TextStyle(color: primaryWhite),
          ),
        ),
      ),
    );
  }
}
