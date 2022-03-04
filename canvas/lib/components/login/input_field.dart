import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  const InputField({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryLightColor, borderRadius: BorderRadius.circular(29)),
      child: TextField(
        decoration: InputDecoration(
          hintText: title,
          border: InputBorder.none,
        ),
      ),
    );
  }
}