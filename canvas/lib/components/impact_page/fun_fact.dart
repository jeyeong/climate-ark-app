import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class FunFact extends StatelessWidget {
  final String text;
  Widget icon;
  final double height;
  var col;

  FunFact(
      {Key? key,
      required this.text,
      required this.height,
      required this.icon,
      required this.col})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: height,
      padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Center(
        child: Container(
          //color: col,
          decoration: BoxDecoration(
            color: col,
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color.fromARGB(0, 0, 0, 0),
              width: 1,
            ),
          ),
          child: ListTile(
            tileColor: col,
            leading: Transform.scale(scale: 2.0, child: icon),
            minLeadingWidth: 50.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromARGB(0, 0, 0, 0), width: 1),
                borderRadius: BorderRadius.circular(15)),
            title: Text(
              text,
              style: TextStyle(
                  fontSize: height / 5,
                  //fontWeight: FontWeight.bold, ),
                  fontFamily: "Poppins",
                  color: primaryWhite),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
