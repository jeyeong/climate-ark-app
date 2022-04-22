import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  Button({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: const Color(0xff09bc8a),
    padding: const EdgeInsets.symmetric(
      vertical: 24.0,
      horizontal: 40.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffddf6ef),
            spreadRadius: 0.5,
            blurRadius: 1.5,
            offset: Offset(3, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextButton(
          style: buttonStyle,
          onPressed: callback,
          child: Text(
            text,
            style: const TextStyle(color: Color(0xffffffff)),
          ),
        ),
      ),
    );
  }
}
