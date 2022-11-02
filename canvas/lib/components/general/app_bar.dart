import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/profile_page.dart';
class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Material(
            color: primaryDarkerColor,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                splashColor: primaryDarkestColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage(name: 'John Doe')));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: primaryLightColor, width: 3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Ink.image(
                      image: AssetImage("assets/dummy.png"),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    )))));
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
