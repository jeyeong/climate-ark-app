import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/gadgets/logo.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: const Logo(width: 60.0),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: primaryWhite,
            width: 400.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("hahaha you forgot ur password :P"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
