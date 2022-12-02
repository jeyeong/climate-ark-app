import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/action_page.dart';
import 'package:canvas/views/impact_page.dart';
import 'package:canvas/components/general/app_bar.dart';

import 'package:canvas/data.dart';
import 'package:canvas/utils/completionHandlers.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.accountData,
    required this.actions,
  }) : super(key: key);

  final AccountData accountData;
  final List<CarbonAction> actions;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Action modification logic.
  late AccountData __accountData = widget.accountData;

  // Handler for adding completed action.
  void addCompletedAction(int actionID) {
    DateTime dt = DateTime.now();
    String completedActionStamp = '${dt.millisecondsSinceEpoch},$actionID';

    // Update state.
    setState(() {
      List<List<Object>> newActionsCompleted =
          List.from(__accountData.actionsCompleted)..add([dt, actionID]);
      List<List<Object>> newActionsCompletedToday =
          List.from(__accountData.actionsCompletedToday)..add([dt, actionID]);

      AccountData newAccountData = AccountData(
        __accountData.accountID,
        __accountData.firstName,
        __accountData.lastName,
        __accountData.streak,
        newActionsCompleted,
        newActionsCompletedToday,
      );

      __accountData = newAccountData;
    });

    // Add to DB.
    addCompletedActionToDB(completedActionStamp, __accountData.accountID);
  }

  // Handler for removing completed action.
  void removeCompletedAction(String completedActionStamp) {
    // Update state.
    setState(() {
      List<List<Object>> newActionsCompleted =
          List.from(__accountData.actionsCompleted)
            ..removeWhere((element) {
              DateTime dt = element[0] as DateTime;
              int actionID = element[1] as int;
              return '${dt.millisecondsSinceEpoch},$actionID' ==
                  completedActionStamp;
            });
      List<List<Object>> newActionsCompletedToday =
          List.from(__accountData.actionsCompletedToday)
            ..removeWhere((element) {
              DateTime dt = element[0] as DateTime;
              int actionID = element[1] as int;
              return '${dt.millisecondsSinceEpoch},$actionID' ==
                  completedActionStamp;
            });

      AccountData newAccountData = AccountData(
        __accountData.accountID,
        __accountData.firstName,
        __accountData.lastName,
        __accountData.streak,
        newActionsCompleted,
        newActionsCompletedToday,
      );

      __accountData = newAccountData;
    });

    // Remove from DB.
    removeCompletedActionFromDB(completedActionStamp, __accountData.accountID);
  }

  // Navigation bar logic.
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(
        accountData: __accountData,
        actions: widget.actions,
        addCompletedAction: addCompletedAction,
        removeCompletedAction: removeCompletedAction,
      ),
      ActionPage(
        accountData: __accountData,
        actions: fakeActions,
        addCompletedAction: addCompletedAction,
        removeCompletedAction: removeCompletedAction,
      ),
      ImpactPage(
        accountData: __accountData,
        actions: fakeActions,
      ),
    ];

    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: JanusAppBar(),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Action',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Impact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryDarkestColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
