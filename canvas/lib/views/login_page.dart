import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/login/login_button.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/logo.dart';
import 'package:canvas/components/login/password_field.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/views/forgot_pass_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryWhite,
          child: Center(
            child: Column(
              children: [
                // Part below app bar
                Container(
                  height: 10.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(15, 10),
                      bottomRight: Radius.elliptical(15, 10),
                    ),
                    color: Color(0xff08b184),
                  ),
                ),
                // Main content
                SizedBox(
                  width: 400.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Logo(width: 200.0),
                      const InputField(title: 'Username'),
                      const SizedBox(height: 20.0),
                      const PasswordField(),
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
                                    builder: (context) =>
                                        const ForgotPassPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
