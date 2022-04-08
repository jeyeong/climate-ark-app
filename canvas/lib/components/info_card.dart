import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget{
  final String text, days;
  Widget icon;
  final double height;
  //InfoCard({Key? key, required this.text, required this.days,required this.height, this.icon = SizedBox.shrink()}) : super(key: key);
  InfoCard({Key? key, required this.text, required this.days,required this.height, required this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0), 
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Center(
        child: ListTile(
          leading: Transform.scale(
            scale: 2.0,
            child: icon),
          minLeadingWidth: 50.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1), 
            borderRadius: BorderRadius.circular(15)),
          
          title: Text(text,
              style: TextStyle(
                fontSize: (height/3),
                fontWeight: FontWeight.bold, ),
              textAlign: TextAlign.center,
              ),
          trailing: Container(
            width: height/ 2,
            height: height / 2,
        
            decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.black, width: 1.5))
              ),
            child: Center(
              child:  Text(days, 
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,), 
            )

          )
        ),
      )
    );
  }
}
