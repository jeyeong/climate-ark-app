import 'package:flutter/material.dart';
import 'package:canvas/views/login_page/components/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          width: size.width * 0.5,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoginButton()],
          ))),
    );
  }
}
