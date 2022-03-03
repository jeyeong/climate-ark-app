import 'package:flutter/material.dart';
import 'package:canvas/components/login/login_button.dart';
import 'package:canvas/components/login/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 400.0,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InputField(title: 'Username'),
              const SizedBox(height: 20.0),
              const InputField(title: 'Password'),
              const SizedBox(height: 22.5),
              LoginButton(),
            ],
          ))),
    );
  }
}
