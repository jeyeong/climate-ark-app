import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class InfoCard extends StatelessWidget{
  final String text, points, dates;
  //Widget icon;
  final double height;
  //InfoCard({Key? key, required this.text, required this.days,required this.height, this.icon = SizedBox.shrink()}) : super(key: key);
  InfoCard({Key? key, required this.text, required this.points,required this.height, required this.dates}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0), 
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Center(
        child: ListTile(
          leading: Text(dates,
              style: TextStyle(
                fontSize: (height/5),
                fontWeight: FontWeight.bold, 
                color: primaryLightestColor,
                ),
              textAlign: TextAlign.center,
              ),
          
          
          title: Text(text,
              style: TextStyle(
                fontSize: (height/3),
                fontWeight: FontWeight.bold, ),
              textAlign: TextAlign.center,
              ),
          trailing: Container(
            width: height/ 2,
            height: height / 2,
        
            child: Center(
              child:  Text(points, 
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              textAlign: TextAlign.center,), 
            )

          )
        ),
      )
    );
  }

}