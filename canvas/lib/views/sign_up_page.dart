import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/general/button.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

final user = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void checkSignUpCredentials() async {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match.')));
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Account created.')));

      // try {
      //   final credential =
      //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: 'test@email.com',
      //     password: '123456',
      //   );

      //   print(credential);
      // } catch (e) {
      //   print(e);
      // }

      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: JanusAppBar(),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                InputField(
                  title: 'First Name',
                  controller: firstNameController,
                ),
                const SizedBox(height: 20.0),
                InputField(
                  title: 'Last Name',
                  controller: lastNameController,
                ),
                const SizedBox(height: 60.0),
                InputField(
                  title: 'Username',
                  controller: usernameController,
                ),
                const SizedBox(height: 20.0),
                InputField(
                  title: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 20.0),
                InputField(
                  title: 'Password',
                  controller: passwordController,
                  obscure: true,
                ),
                const SizedBox(height: 20.0),
                InputField(
                  title: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscure: true,
                ),
                const SizedBox(height: 60.0),
                Button(text: 'SIGN UP', callback: checkSignUpCredentials)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
