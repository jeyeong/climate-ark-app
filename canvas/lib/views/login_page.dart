import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

import 'package:canvas/views/landing_page.dart';
import 'package:canvas/views/sign_up_page.dart';
import 'package:canvas/components/general/input_field.dart';
import 'package:canvas/components/general/button.dart';
import 'package:canvas/components/general/app_bar.dart';
import 'package:canvas/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkLoginCredentials() async {
    UserCredential userCredential;

    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user.')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error occurred.')));
      }
      return;
    }

    // Get account data.
    AccountData accountData = AccountData('', '', '', 0, [], []);

    await db
        .collection("users")
        .where('accountID', isEqualTo: userCredential.user?.uid)
        .get()
        .then((snapshot) {
      QueryDocumentSnapshot doc = snapshot.docs[0];
      Map data = doc.data() as Map;

      // Process actions.
      List<List<Object>> actionsCompleted = [];
      List<List<Object>> actionsCompletedToday = [];
      DateTime now = DateTime.now();

      int streak = 0;
      DateTime nextStreakDate = DateTime(now.year, now.month, now.day - 1);

      for (String stamp in data['completedActions'].reversed.toList()) {
        final splitStamp = stamp.split(',');
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(
          int.parse(splitStamp[0]),
        );
        int actionID = int.parse(splitStamp[1]);

        // Check for actions completed today.
        if (now.day == dt.day && now.month == dt.month && now.year == dt.year) {
          actionsCompletedToday.add([dt, actionID]);
        }

        // Check for streak.
        if (nextStreakDate.day == dt.day &&
            nextStreakDate.month == dt.month &&
            nextStreakDate.year == dt.year) {
          streak += 1;
          nextStreakDate = nextStreakDate.subtract(const Duration(days: 1));
        }

        actionsCompleted.add([dt, actionID]);
      }

      accountData = AccountData(
        data['accountID'],
        data['firstName'],
        data['lastName'],
        streak,
        actionsCompleted,
        actionsCompletedToday,
      );
    });

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
              data['amountSavedAnnually'],
              data['image']),
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
  }

  @override
  Widget build(BuildContext context) {
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
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/hero.png'),
                ),
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
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
