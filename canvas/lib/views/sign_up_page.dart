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
                const Text('Sign Up',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20.0),
                InputFieldTest(
                    title: 'What should we call you?',
                    controller: usernameController,
                    hint: 'Full Name...'),
                const SizedBox(height: 20.0),
                InputFieldTest(
                    title: 'E-mail',
                    controller: emailController,
                    hint: 'e.g. abc@example.com'),
                const SizedBox(height: 20.0),
                InputFieldTest(
                  title: 'Set a Password',
                  controller: passwordController,
                  obscure: true,
                  isPassword: true,
                ),
                const SizedBox(height: 20.0),
                InputFieldTest(
                  title: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscure: true,
                  isPassword: true,
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

class InputFieldTest extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscure;
  final String hint;
  final bool isPassword;

  const InputFieldTest({
    Key? key,
    required this.title,
    required this.controller,
    this.hint = '',
    this.obscure = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: (isPassword)
              ? const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(IconData(0xf197, fontFamily: 'MaterialIcons')),
                )
              : null,
          suffixIconColor: primaryColor,
          labelText: title,
          labelStyle: const TextStyle(color: primaryColor, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: hint,
          hintStyle: const TextStyle(color: darkGrey, fontSize: 15)),
      obscureText: obscure,
    );
  }
}
