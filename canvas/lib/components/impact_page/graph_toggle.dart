import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:canvas/constants.dart';
import 'dart:math';

enum Toggle {daily, weekly, monthly}

class GraphPack extends StatefulWidget {
  final Toggle passedType;
  const GraphPack({Key? key, required this.passedType}): super(key: key);
  @override
  GraphPackState createState() => GraphPackState(passedType: this.passedType);
}

class GraphPackState extends State<GraphPack> {
  String dropdownValue = 'daily';
  Toggle passedType;
  GraphPackState({required this.passedType});

  static const List<Color> gradientColors = [
    primaryColor,
    primaryWhite,
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      // margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0), 
      // decoration: BoxDecoration(
      //     color: primaryLightestColor, borderRadius: BorderRadius.circular(29)),
      //child: LineChart(sampleData1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container( 
              height: 40,
              width: 100, 
              child: makeButton()

            )
          ),
          Expanded(
            child: LineChart(sampleData1)),
        ],)
    );
  }


  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData1,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 9, // should be number of data points that will be in the set
    maxY: 600,
    minY: 0,
    extraLinesData: extraLineData1,
  );

  ExtraLinesData get extraLineData1 => ExtraLinesData(
    verticalLines: <VerticalLine>[
      VerticalLine(x: 0, color: gradientColors[0], strokeWidth: 4),
    ],
  );

  LineTouchData get lineTouchData1 => LineTouchData(enabled: false,);
  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
  ];


  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved:false,
    //color: const Color(0xff09bc81),
    color: primaryColor,
    barWidth: 4,
    isStrokeCapRound: false,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      gradient: const LinearGradient(
        colors: gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ), 
    ),
    spots: (passedType == Toggle.daily) ? spot1 : (passedType == Toggle.weekly) ? spot2 : spot3,  
  );

  List<FlSpot> spot1 = const [
      FlSpot(0, 450),
      FlSpot(1, 540),
      FlSpot(2, 450),
      FlSpot(3, 550),
      FlSpot(4, 400),
      FlSpot(5, 280),
      FlSpot(6, 300),
      FlSpot(7, 290),
      FlSpot(8, 600),
      FlSpot(9, 350),
    ];
  List<FlSpot> spot2 = const [
      FlSpot(0, 250),
      FlSpot(1, 100),
      FlSpot(2, 300),
      FlSpot(3, 550),
      FlSpot(4, 600),
      FlSpot(5, 450),
      FlSpot(6, 300),
      FlSpot(7, 290),
      FlSpot(8, 10),
      FlSpot(9, 350),
    ];

  List<FlSpot> get spot3 => List<FlSpot>.generate(10, (int index)  {
    var random =  Random();
    double randomNumber = random.nextInt(600).toDouble(); 
    return FlSpot(index.toDouble(), randomNumber);
    }
    );
  
  FlGridData get gridData1 => FlGridData(show: false,);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border:  Border(
      bottom: BorderSide(color: gradientColors[0], width: 4), 
      //left: BorderSide(color: gradientColors[0], width: 4),// change length to be leftmost datapoint
      right: BorderSide(color: gradientColors[0], width: 4), // change length to be rightmost datapoint
      left: BorderSide(color: Colors.transparent),
      //right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),

    
  );

  SideTitles get bottomTitles => SideTitles(
    getTitlesWidget: bottomTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 32);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      //color: Color(0xff000000),
      color: darkGrey,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text = Text(value.toString(), style: style);
    return Padding(child: text, padding: const EdgeInsets.only(top: 10.0));
   }
    
  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 3,
    reservedSize: 40,
  );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      //color: Color(0xff000000),
      color: darkGrey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = (value.toInt() % 150 == 0) ? value.toString(): "";
    
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  DropdownButton makeButton() => DropdownButton<Toggle>(
    value: passedType,
    icon: const Icon(Icons.keyboard_arrow_down_outlined,
    color: primaryColor),
    elevation: 16,
    style: const TextStyle(color: darkGrey),
    underline: Container(
      height: 2,
      color: Colors.transparent,
    ),
    onChanged: (Toggle? newValue) {
      setState(() {
        passedType = newValue!;
      });
    },
    items: Toggle.values.map((Toggle value) {
      return DropdownMenuItem<Toggle>(
        value: value,
        child: Text(value.name),
      );
    }).toList(),
  );

}