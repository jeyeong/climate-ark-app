import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/impact_box.dart';
import 'package:canvas/components/impact_page/fun_fact.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';
import 'package:canvas/constants.dart';


class ImpactPage extends StatelessWidget {
  const ImpactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Center(
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 80,
              decoration: const BoxDecoration(
                  color: Color(0xff08b184),
                  //color: primaryWhite,
                  //borderRadius: BorderRadius.circular(50),
                  shape : BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              child: Column(
                children: [
                  const LeafBox(numSaved: 70, size: 100),
                  Text.rich( TextSpan (
                    text: '',
                    children: <TextSpan>[
                      TextSpan(text: '500 ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: primaryWhite)),
                      TextSpan(text: 'Kgs CO2', style: TextStyle(fontSize: 20, color: primaryWhite)),
                    ],
                  )),
                  Text("Carbon Saved", style: TextStyle(
                      fontSize: 20, color: primaryWhite,)), 
                  FunFact(text: "Saving emissions worth a flight \nbetween Delhi and Bangalore", height: 70.0, icon: Icon(Icons.airplanemode_on), col: primaryLightColor), 
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(margin: EdgeInsets.all(10), 
                            width: MediaQuery.of(context).size.width, 
                            height: 30, 
                            color: Colors.red,
                            child: Text("boxes")),
                  ImpactBox()
                ]
              ),
            ),
          ],
        ),                      
      )
      )
      )
    );
  }
}