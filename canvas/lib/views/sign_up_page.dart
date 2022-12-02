import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/general/button.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void checkSignUpCredentials() async {
      if (emailController.text == '' ||
          firstNameController.text == '' ||
          lastNameController.text == '' ||
          passwordController.text == '' ||
          confirmPasswordController.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('One or more fields is empty.')));
        return;
      }

      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match.')));
        return;
      }

      try {
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        final String uid = credential.user!.uid;

        try {
          await db.collection("users").add({
            'accountID': uid,
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'completedActions': [],
          });
        } catch (e) {
          print(e);
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('The password provided is too weak.')));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('The account already exists for that email.')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.code)));
        }
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
