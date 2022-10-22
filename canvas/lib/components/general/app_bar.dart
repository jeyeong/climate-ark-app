import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage('assets/dummy.png'),
      ),
      margin: const EdgeInsets.all(10.0),
    );
  }
}

class JanusAppBar extends StatelessWidget {
  const JanusAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const ProfilePic(),
      title: const Text(
        'J A N U S',
        style: TextStyle(
          color: Color(0xff62cfb2),
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xff08b184),
      centerTitle: true,
      elevation: 0,
    );
  }
}
