import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/classes.dart';

class Home_ extends StatefulWidget {
  const Home_({ Key? key }) : super(key: key);

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {

  Container BuildFilterButton({String txt = ''}) {
    
    return Container(
      width: 200.0,
      height: 65,
      alignment: Alignment.center,
      child: OutlinedButton(
          onPressed: () {
            setState(() {
              TaskBrain.filterbyType(filt: txt);
              print(TaskBrain.currList[0].tasktitle);
            });
            
          },
          child: Text(txt, style: TextStyle(color: Colors.white)),
          style: OutlinedButton.styleFrom(
              fixedSize: Size(190, 65),
              alignment: Alignment.center,
              side: BorderSide(
                  width: 1.3, color: Colors.white, style: BorderStyle.solid))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 0, height: 60, color: Colors.teal),
        Container(
          color: primaryColor,
          height: 70,
          child: ListView(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            children: [
            
              //BuildFilterButton(txt: 'Reset'),
              BuildFilterButton(txt: 'Electricity'),
              BuildFilterButton(txt: 'Emissions'),
              BuildFilterButton(txt: 'filter3'),
              BuildFilterButton(txt: 'filter4'),
              BuildFilterButton(txt: 'filter5'),
              BuildFilterButton(txt: 'filter6'),
              BuildFilterButton(txt: 'filter7'),
              BuildFilterButton(txt: 'filter8'),
            ],
          ),
        ),
      ],
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
  
//   Container BuildFilterButton({String txt = ''}) {
    
//     return Container(
//       width: 200.0,
//       height: 65,
//       alignment: Alignment.center,
//       child: OutlinedButton(
//           onPressed: () {
            
//             TaskBrain.filterbyType(filt: txt);
//           },
//           child: Text(txt, style: TextStyle(color: Colors.white)),
//           style: OutlinedButton.styleFrom(
//               fixedSize: Size(190, 65),
//               alignment: Alignment.center,
//               side: BorderSide(
//                   width: 1.3, color: Colors.white, style: BorderStyle.solid))),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(width: 0, height: 60, color: Colors.teal),
//         Container(
//           color: primaryColor,
//           height: 70,
//           child: ListView(
//             padding: const EdgeInsets.all(8),
//             scrollDirection: Axis.horizontal,
//             children: [
            
//               //BuildFilterButton(txt: 'Reset'),
//               BuildFilterButton(txt: 'Electricity'),
//               BuildFilterButton(txt: 'Emissions'),
//               BuildFilterButton(txt: 'filter3'),
//               BuildFilterButton(txt: 'filter4'),
//               BuildFilterButton(txt: 'filter5'),
//               BuildFilterButton(txt: 'filter6'),
//               BuildFilterButton(txt: 'filter7'),
//               BuildFilterButton(txt: 'filter8'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
