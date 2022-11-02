import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color color;

  const Button({
    Key? key,
    required this.text,
    required this.callback,
    this.color = primaryColor,
  }) : super(key: key);

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
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 40.0,
            ),
          ),
          onPressed: callback,
          child: Text(
            text,
            style: const TextStyle(color: primaryWhite),
          ),
        ),
      ),
    );
  }
}
