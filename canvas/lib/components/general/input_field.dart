import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscure;
  final Color labelColor;

  const InputField({
    Key? key,
    required this.title,
    required this.controller,
    this.obscure = false,
    this.labelColor = primaryBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: title,
        labelStyle: TextStyle(color: labelColor),
      ),
      obscureText: obscure,
    );
  }
}
