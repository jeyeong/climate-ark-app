import 'package:flutter/material.dart';

class FunFact extends StatelessWidget{
  final String text;
  Widget icon;
  final double height;
  var col;

  FunFact({Key? key, required this.text, required this.height, required this.icon, required this.col}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0), 
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Center(
        child: ListTile(
          tileColor: col,
          leading: Transform.scale(
            scale: 2.0,
            child: icon),
          minLeadingWidth: 50.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1), 
            borderRadius: BorderRadius.circular(15)),
          
          title: Text(text,
              style: TextStyle(
                fontSize: height/4,
                fontWeight: FontWeight.bold, ),
              textAlign: TextAlign.center,
              ),
        ),
      )
    );
  }
}