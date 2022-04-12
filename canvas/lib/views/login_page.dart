import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/login/login_button.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/login/password_field.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/views/forgot_pass_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    nameController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Second text field: ${nameController.text}');
  }

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
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
