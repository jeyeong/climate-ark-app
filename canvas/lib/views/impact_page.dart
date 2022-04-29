import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/impact_box.dart';
import 'package:canvas/components/impact_page/fun_fact.dart';

class ImpactPage extends StatelessWidget {
  const ImpactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                  child: Column(children: [
                    FunFact(text: "Saving emissions worth a flight \nbetween Delhi and Bangalore", height: 80.0, icon: Icon(Icons.airplanemode_on), col: Colors.white), 
                    ImpactBox()]),
    )
    )
    )
    );
  }
}
