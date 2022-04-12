import 'package:canvas/components/general/button.dart';
import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/views/forgot_pass_page.dart';

import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/login/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loggedIn = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void printLoginCredentials() {
    if (nameController.text == 'techteam' &&
        passwordController.text == '1234') {
      setState(() {
        loggedIn = true;
      });
    } else {
      print('Wrong user/pass!');
    }
  }

  @override
  Widget build(BuildContext context) {
    /* Temporary simulation of logging in */
    if (loggedIn) {
      return const HomePage();
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            color: primaryWhite,
            child: Column(
              children: [
                // Main content
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                        child: Image.asset('assets/hero.png'),
                      ),
                      InputField(
                        title: 'Username',
                        controller: nameController,
                      ),
                      const SizedBox(height: 20.0),
                      PasswordField(
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20.0),
                      Button(
                        text: 'LOG-IN',
                        callback: printLoginCredentials,
                      ),
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
