import 'package:flutter/material.dart';

class CircleWithText extends StatelessWidget {
  const CircleWithText({Key? key, required this.title, required this.radius})
      : super(key: key);

  final String title;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: CircleBorder(
              side: BorderSide(color: Colors.black, width: 0.015 * radius))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 0.15 * radius,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
