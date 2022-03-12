import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/components/actions/action_item.dart';
import 'package:canvas/components/gadgets/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkerColor,
        title: const Logo(width: 60.0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 400.0,
              color: primaryWhite,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(height: 20.0),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        ActionItem(),
                        SizedBox(height: 20.0),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Go back!'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryDarkerColor, // background
                        onPrimary: primaryWhite, // foreground
                      ),
                    ),
                    const SizedBox(height: 20.0),
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
