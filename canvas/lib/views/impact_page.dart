import 'package:canvas/components/impact_page/action_card.dart';
import 'package:canvas/components/impact_page/streak_action_card.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/impact_box.dart';
import 'package:canvas/components/impact_page/fun_fact.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';
import 'package:canvas/constants.dart';

import '../components/impact_page/streak_card.dart';

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
              //color: primaryWhite,
              //borderRadius: BorderRadius.circular(50),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                LeafBox(numSaved: 70, size: 110),
                Text.rich(TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                        text: '500 ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: 'Kgs CO',
                        style: TextStyle(
                            fontSize: 20,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: '2',
                        style: TextStyle(
                            fontSize: 10,
                            color: primaryWhite,
                            fontFamily: "Poppins")),
                  ],
                )),
                Text("Carbon Saved",
                    style: TextStyle(
                        fontSize: 15,
                        color: primaryWhite,
                        fontFamily: "Poppins")),
                FunFact(
                    text:
                        "Going great! You saved emissions worth\n a flight between Delhi and Banglore",
                    height: 70.0,
                    icon: Icon(Icons.airplanemode_on),
                    col: primaryLighterColor),
              ],
            ),
          ),
          Container(
            child: Column(children: [
              StreakActionCard(
                streakDays: 7,
                numActionsCompleted: 12,
                boxHeight: 50,
              ),

              // Container(margin: EdgeInsets.all(10),
              //           width: MediaQuery.of(context).size.width,
              //           height: 30,
              //           color: Colors.red,
              //           child: Text("boxes")),

              ImpactBox()
            ]),
          ),
        ],
      ),
    ))));
  }
}
