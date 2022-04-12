import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordView,
          hoverColor: const Color(0x00000000),
          splashColor: const Color(0x00000000),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //               color: primaryLightestColor,
  //               borderRadius: BorderRadius.circular(29)),
  //           child: TextFormField(
  //             cursorColor: primaryDarkColor,
  //             // keyboardType: TextInputType.text,
  //             decoration: const InputDecoration(
  //               labelText: 'Password',
  //               labelStyle: TextStyle(color: lightGrey),
  //               border: InputBorder.none,
  //               /*
  //               icon: const Padding(
  //                 padding: const EdgeInsets.only(top: 15.0),
  //                 child: const Icon(Icons.lock),
  //               ),*/
  //             ),
  //             onSaved: (val) => _password = val,
  //             obscureText: _obscureText,
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: _toggle,
  //           child: Text(
  //             _obscureText ? "Show" : "Hide",
  //             style: const TextStyle(color: primaryDarkestColor),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
