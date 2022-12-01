import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class InfoCard extends StatelessWidget {
  final String text, points, dates;
  //Widget icon;
  final double height;
  //InfoCard({Key? key, required this.text, required this.days,required this.height, this.icon = SizedBox.shrink()}) : super(key: key);
  InfoCard(
      {Key? key,
      required this.text,
      required this.points,
      required this.height,
      required this.dates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Center(
          child: ListTile(
              leading: Text(
                dates,
                style: TextStyle(
                  fontSize: (height / 5),
                  color: Color(0xffcfcfcf),
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
              title: Text(
                text,
                style: TextStyle(fontSize: (height / 3), fontFamily: "Poppins"),
                textAlign: TextAlign.left,
              ),
              trailing: Container(
                  width: height,
                  height: height,
                  child: Center(
                    child: Text(
                      points,
                      style: TextStyle(
                        fontSize: (height / 3),
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: "Poppins",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ));
  }
}
