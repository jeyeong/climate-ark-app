import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/impact_box.dart';
import 'package:canvas/components/impact_page/fun_fact.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';


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
                        height: MediaQuery.of(context).size.height / 2 - 100,
                        decoration: BoxDecoration(
                            color: Color(0xff08b184),
                            //borderRadius: BorderRadius.circular(50),
                            shape : BoxShape.rectangle,
                          ),
                        child: Column(
                          children: [
                            LeafBox(numSaved: 70, size: 100),
                            FunFact(text: "Saving emissions worth a flight \nbetween Delhi and Bangalore", height: 80.0, icon: Icon(Icons.airplanemode_on), col: primaryLightColor), 
                        
                          ],
                        ),
                      ),
                      Container(
                        child: ImpactBox()
                      ),
                    ],
                  ),

                      
    )
    )
    )
    );
  }
}
