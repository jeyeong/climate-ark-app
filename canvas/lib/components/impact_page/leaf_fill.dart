import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:canvas/components/impact_page/leaf.dart';

class LeafBox extends StatefulWidget {
  final int numSaved;
  final double size;
  const LeafBox({required this.numSaved, required this.size, Key? key})
      : super(key: key);

  _LeafState createState() =>
      _LeafState(numSaved: this.numSaved, size: this.size);
}

class _LeafState extends State<LeafBox> {
  int numSaved;
  double size;
  _LeafState({required this.numSaved, required this.size});

  //double size = 350;

  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: primaryLightestColor,
              borderRadius: BorderRadius.circular(size / 7),
              shape: BoxShape.rectangle,
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NativeClipper(),
              child: Container(
                width: size,
                height: numSaved / 100 * size,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [primaryLighterColor, primaryLightestColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                //color: primaryLighterColor,
              ),
            ),
          ),
          // from https://www.fluttericon.com/
          Icon(
            MyFlutterApp.leaf,
            color: primaryColor,
            size: size / 4,
          ),
        ],
      ),
    );
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double rdRad = 2 * size.height / 7;
    double fillHeight = size.height * 0.2;
    path.lineTo(0, size.height - rdRad);
    path.quadraticBezierTo(0, size.height, rdRad, size.height);
    path.lineTo(size.width - rdRad, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - rdRad);
    path.lineTo(size.width, fillHeight);
    // to halfway point, with bezier focus in a random spot in between 0.5 and 1
    var random = Random();
    double ran = random.nextDouble() / 4;
    path.quadraticBezierTo(size.width / 4 * 3 + ran, fillHeight + rdRad,
        size.width / 2, fillHeight);
    random = Random();
    ran = random.nextDouble() / 4;
    path.quadraticBezierTo(
        size.width / 4 + ran, fillHeight - rdRad, 0, fillHeight);
    path.lineTo(0, size.height - rdRad);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
