import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ActionsCard extends StatelessWidget {
  final String actionName;
  final String actionDescription;
  final String actionType;
  const ActionsCard(
      {Key? key,
      required this.actionName,
      required this.actionDescription,
      required this.actionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          imageMaker(actionType),
          //Image.asset('assets/carpool.jpg'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(actionName, //'Carpooling',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey)),
              Container(
                  width: 425,
                  child: Flexible(
                    child: Text(
                      actionDescription,
                      overflow: TextOverflow.visible,
                      //'Instead of driving solo, carpool & save some money & the planet :)')
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageMaker(String category) {
    if (actionType == "Transportation") {
      return Image.asset('assets/carpool.jpg');
    } else {
      return Image.asset('assets/water.jpeg');
    }
  }
}
