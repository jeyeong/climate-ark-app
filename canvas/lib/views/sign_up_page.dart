import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/general/button.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/app_bar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void checkSignUpCredentials() {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match.')));
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Account created.')));

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
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                InputField(title: 'Username', controller: usernameController),
                const SizedBox(height: 20.0),
                InputField(title: 'Email', controller: emailController),
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
                const SizedBox(height: 20.0),
                Button(text: 'SIGN UP', callback: checkSignUpCredentials)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
