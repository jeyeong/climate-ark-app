import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

import 'package:canvas/views/actual_landing_page.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/button.dart';
import 'package:canvas/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkLoginCredentials() async {
    if (usernameController.text == 'tt' && passwordController.text == '123') {
      // Get data.
      final AccountData accountData = fakeAccountData;
      final List<CarbonAction> actions = [];

      // Process actions data.
      await db.collection("carbon-actions").get().then((event) {
        for (var doc in event.docs) {
          var data = doc.data();
          actions.add(
            CarbonAction(
                data['id'],
                data['actionName'],
                data['actionDescription'],
                data['category'],
                data['carbonScore'],
                data['amountSavedAnnually']),
          );
        }
      });

      // Move to home page.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(
            accountData: accountData,
            actions: actions,
          ),
        ),
      );
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/hero.png'),
              ),
              InputField(
                title: 'Username',
                controller: usernameController,
              ),
              const SizedBox(height: 20.0),
              InputField(
                title: 'Password',
                controller: passwordController,
                obscure: true,
              ),
              const SizedBox(height: 20.0),
              Button(
                text: 'LOG-IN',
                callback: checkLoginCredentials,
              ),
              const SizedBox(height: 20.0),
              InkWell(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
