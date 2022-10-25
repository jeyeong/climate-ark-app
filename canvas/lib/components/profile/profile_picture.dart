
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  // const ProfilePicture({super.key})

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/Cartoonito-Logo.png'),
      ) 
    );
  }
}