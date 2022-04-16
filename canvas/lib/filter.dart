import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Container BuildFilterButton({String txt = ''}) {
    return Container(
      width: 200.0,
      height: 65,
      alignment: Alignment.center,
      child: OutlinedButton(
          onPressed: () {
            print(txt);
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
          color: Colors.teal,
          height: 70,
          child: ListView(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            children: [
              BuildFilterButton(txt: 'Sorry '),
              BuildFilterButton(txt: 'I\'ll'),
              BuildFilterButton(txt: 'attend'),
              BuildFilterButton(txt: 'the '),
              BuildFilterButton(txt: 'meeting'),
              BuildFilterButton(txt: 'next week'),
              BuildFilterButton(txt: '-Wes'),
            ],
          ),
        ),
      ],
    );
  }
}
