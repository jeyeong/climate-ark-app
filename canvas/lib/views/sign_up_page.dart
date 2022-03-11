import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/sign_up/sign_up_button.dart';
import 'package:canvas/components/login/input_field.dart';
import 'package:canvas/components/gadgets/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: const Logo(width: 60.0),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: primaryWhite,
            width: 400.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const InputField(title: 'Your Name'),
                    const SizedBox(height: 20.0),
                    const InputField(title: 'Username'),
                    const SizedBox(height: 20.0),
                    const InputField(title: 'Password'),
                    const SizedBox(height: 20.0),
                    const InputField(title: 'Confirm Password'),
                    const SizedBox(height: 20.0),
                    SignUpButton(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
