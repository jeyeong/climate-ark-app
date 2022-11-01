import 'package:canvas/components/action_page/suggestions_box.dart';
import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:canvas/components/action_page/search_bar.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //replace line 15 Stack with Column to see scrollable functionality
      body: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            //color: Colors.transparent,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            //SearchBar(),
            child: Column(children: [
              Positioned.fill(child: SearchBar()),
              Positioned(top: 60, child: SuggestionBox()),
            ]),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                //Container(width: 80, height: 80, color: Colors.blueGrey),
                Icon(
                  Icons.car_crash_rounded,
                  color: Colors.blue,
                  size: 50.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Carpooling',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey)),
                    Text(
                        'Instead of driving solo, carpool & save some money & the planet :)')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
