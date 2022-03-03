import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: FlatButton(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: primaryColor,
            onPressed: () {},
            child: const Text(
              "LOGIN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
