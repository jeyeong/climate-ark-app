import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/login/login_button.dart';
import 'package:canvas/components/login/input_field.dart';
import 'package:canvas/components/gadgets/logo.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/views/forgot_pass_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: primaryWhite,
          width: 400.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(width: 200.0),
                  const InputField(title: 'Username'),
                  const SizedBox(height: 20.0),
                  const InputField(title: 'Password'),
                  const SizedBox(height: 20.0),
                  LoginButton(),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      InkWell(
                        child: const Text('Sign Up'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                      ),
                      const Spacer(),
                      InkWell(
                        child: const Text('Forgot Password?'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
