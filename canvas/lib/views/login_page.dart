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
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkLoginCredentials() {
    if (usernameController.text == 'techteam' &&
        passwordController.text == '1234') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logged in.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong username/password.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/hero.png'),
            ),
            InputField(title: 'Username', controller: usernameController),
            const SizedBox(height: 20.0),
            InputField(title: 'Password', controller: passwordController),
            const SizedBox(height: 20.0),
            Button(text: 'LOG-IN', callback: checkLoginCredentials),
          ],
        ),
      ),
    ));

    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 30),
    //         color: primaryWhite,
    //         child: Column(
    //           children: [
    //             // Main content
    //             SizedBox(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
    //                     child: Image.asset('assets/hero.png'),
    //                   ),
    //                   InputField(
    //                     title: 'Username',
    //                     controller: usernameController,
    //                   ),
    //                   const SizedBox(height: 20.0),
    //                   PasswordField(
    //                     controller: passwordController,
    //                   ),
    //                   const SizedBox(height: 20.0),
    //                   Button(
    //                     text: 'LOG-IN',
    //                     callback: printLoginCredentials,
    //                   ),
    //                   const SizedBox(height: 20.0),
    //                   Row(
    //                     children: [
    //                       InkWell(
    //                         child: const Text('Sign Up'),
    //                         onTap: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => const SignUpPage()),
    //                           );
    //                         },
    //                       ),
    //                       const Spacer(),
    //                       InkWell(
    //                         child: const Text('Forgot Password?'),
    //                         onTap: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) =>
    //                                     const ForgotPassPage()),
    //                           );
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
