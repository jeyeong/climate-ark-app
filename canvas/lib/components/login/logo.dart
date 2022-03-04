import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image(
            image: const AssetImage('assets/icons/logo.png'),
          ),
        ),
      ),
    );
  }
}
