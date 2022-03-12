// ignore_for_file: unnecessary_const
import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // Initially password is obscure
  bool _obscureText = true;

  String? _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryLightestColor,
                borderRadius: BorderRadius.circular(29)),
            child: TextFormField(
              cursorColor: primaryDarkColor,
              // keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: lightGrey),
                border: InputBorder.none,
                /*
                icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(Icons.lock),
                ),*/
              ),
              onSaved: (val) => _password = val,
              obscureText: _obscureText,
            ),
          ),
          TextButton(
            onPressed: _toggle,
            child: Text(
              _obscureText ? "Show" : "Hide",
              style: const TextStyle(color: primaryDarkestColor),
            ),
          )
        ],
      ),
    );
  }
}
