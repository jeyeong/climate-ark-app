import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Material(
            color: primaryDarkerColor,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                splashColor: primaryDarkestColor,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: primaryDarkerColor, width: 5),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Ink.image(
                      image: const AssetImage("assets/dummy.png"),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    )))));
  }
}
