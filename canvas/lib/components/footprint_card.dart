import 'package:flutter/material.dart';
//import 'package:canvas/constants.dart';

class FootprintCard extends StatelessWidget {
  final String toptext, circletext;
  final double radius; 
  const FootprintCard({Key? key, required this.toptext, required this.circletext, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      // margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      // decoration: BoxDecoration(
      //     color: primaryLightestColor, borderRadius: BorderRadius.circular(29)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(toptext,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold, ),
            textAlign: TextAlign.center,
            ),
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: CircleBorder(
                side: BorderSide(color: Colors.black, width: 3.0))
            ),
            child: Center(
              child:  Text(circletext, 
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,), 
            )
          )
        ],
      ),
    );
  }
}