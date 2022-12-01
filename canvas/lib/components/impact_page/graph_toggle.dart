import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:canvas/constants.dart';
import 'dart:math';

import '../../data.dart';
import '../../utils/utils.dart';

enum Toggle { daily, weekly, monthly }

class GraphPack extends StatefulWidget {
  final Toggle passedType;
  final AccountData accountData;
  final List<CarbonAction> actions;

  const GraphPack({
    Key? key,
    required this.passedType,
    required this.accountData,
    required this.actions,
  }) : super(key: key);
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
        width: double.infinity,
        height: 230,
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Container(height: 40, width: 220, child: makeButton())),
            Expanded(child: LineChart(sampleData1)),
          ],
        ));
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData1,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 6, // should be number of data points that will be in the set
        // maxY: 600,
        maxY: ((valuesToUse.map<double>((e) => e.y).reduce(max) + 99) / 100) *
            100,
        minY: 0,
        extraLinesData: extraLineData1,
      );

  ExtraLinesData get extraLineData1 => ExtraLinesData(
        verticalLines: <VerticalLine>[
          VerticalLine(x: 0, color: gradientColors[0], strokeWidth: 4),
        ],
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        enabled: false,
      );
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
        isCurved: false,
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
        spots: valuesToUse,
        // spots: dailyValues,
      );

  FlGridData get gridData1 => FlGridData(
        show: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: gradientColors[0], width: 4),
          //left: BorderSide(color: gradientColors[0], width: 4),// change length to be leftmost datapoint
          right: BorderSide(
              color: gradientColors[0],
              width: 4), // change length to be rightmost datapoint
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
  List<FlSpot> get dailyValues => List<FlSpot>.generate(7, (int index) {
        DateTime dayMatch = now.subtract(Duration(days: 6 - index));
        List<List<Object>> tasksDone =
            widget.accountData.actionsCompleted.where((i) {
          DateTime dayInfo = i[0] as DateTime;
          return dayInfo.difference(dayMatch).inDays == 0;
        }).toList();
        List<int> IDsOfCompletedActions =
            tasksDone.map((List<Object> action) => action[1] as int).toList();
        List<CarbonAction> actionsDone =
            getCompletedActions(widget.actions, IDsOfCompletedActions);
        double score = calculateCarbonSaved(actionsDone);
        // print('(' + index.toString() + ', ' + score.toString() + ')');
        return FlSpot(index.toDouble(), score);
      });

  List<FlSpot> get weeklyValues => List<FlSpot>.generate(7, (int index) {
        DateTime dayMatch =
            firstDayOfWeek.subtract(Duration(days: (6 - index) * 7));
        // print(dayMatch);
        List<List<Object>> tasksDone =
            widget.accountData.actionsCompleted.where((i) {
          DateTime dayInfo = i[0] as DateTime;
          return dayInfo.difference(dayMatch).inDays < 6;
        }).toList();
        List<int> IDsOfCompletedActions =
            tasksDone.map((List<Object> action) => action[1] as int).toList();
        // print(IDsOfCompletedActions);
        List<CarbonAction> actionsDone =
            getCompletedActions(widget.actions, IDsOfCompletedActions);
        double score = calculateCarbonSaved(actionsDone);
        // print('(' + index.toString() + ', ' + score.toString() + ')');
        return FlSpot(index.toDouble(), score);
      });

  List<FlSpot> get monthlyValues => List<FlSpot>.generate(7, (int index) {
        DateTime dayMatch = now.subtract(Duration(days: (6 - index) * 30));
        // print(dayMatch);
        List<List<Object>> tasksDone =
            widget.accountData.actionsCompleted.where((i) {
          DateTime dayInfo = i[0] as DateTime;
          return dayInfo.month == dayMatch.month;
        }).toList();
        List<int> IDsOfCompletedActions =
            tasksDone.map((List<Object> action) => action[1] as int).toList();
        // print(IDsOfCompletedActions);
        List<CarbonAction> actionsDone =
            getCompletedActions(widget.actions, IDsOfCompletedActions);
        double score = calculateCarbonSaved(actionsDone);
        // print('(' + index.toString() + ', ' + score.toString() + ')');
        return FlSpot(index.toDouble(), score);
      });
  List<FlSpot> get valuesToUse => (passedType == Toggle.daily)
      ? dailyValues
      : (passedType == Toggle.weekly)
          ? weeklyValues
          : monthlyValues;
  DateTime now = DateTime.now();
  late int currentDay = now.weekday;
  late DateTime firstDayOfWeek = now.subtract(Duration(days: currentDay));

  List<String> get bottomTitleGenerate => List<String>.generate(7, (int index) {
        int firstNum = (passedType == Toggle.monthly)
            ? now.subtract(Duration(days: 30 * index)).month
            : (passedType == Toggle.weekly)
                ? firstDayOfWeek.subtract(Duration(days: 7 * index)).month
                : now.subtract(Duration(days: index)).month;
        int secNum = (passedType == Toggle.monthly)
            ? now.day
            : (passedType == Toggle.weekly)
                ? firstDayOfWeek.subtract(Duration(days: 7 * index)).day
                : now.subtract(Duration(days: index)).day;
        return firstNum.toString() + "/" + secNum.toString();
      });

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final titles = bottomTitleGenerate.reversed.toList();

    const style = TextStyle(
      //color: Color(0xff000000),
      color: darkGrey,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
    Widget text = Text(titles[value.toInt()], style: style);
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
      color: darkGrey,
      fontFamily: "Poppins",
      fontSize: 14,
    );
    // double maxVal = valuesToUse.map<double>((e) => e.y).reduce(max);

    // int interval = ((maxVal ~/ 3) ~/ 50) * 50 + 50;
    // print(interval);
    // int interval = ((maxVal ~/ 3) / 50).floor() * 50;
    // int interval = maxVal ~/ 3;
    String text = (value.toInt() % 150 == 0) ? value.toString() : "";

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  DropdownButton makeButton() => DropdownButton<Toggle>(
        value: passedType,
        icon:
            const Icon(Icons.keyboard_arrow_down_outlined, color: primaryColor),
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
            child: Text(
              capitalize(value.name) + " CO2 Emissions Saved",
              style: const TextStyle(fontFamily: "Poppins", fontSize: 12),
            ),
          );
        }).toList(),
      );
}
