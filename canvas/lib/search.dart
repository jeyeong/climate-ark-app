import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:canvas/constants.dart';

//import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({ Key? key }) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  get showIfOpened => null;

  @override
  Widget build(BuildContext context) {
    // return searchBarUI();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit:StackFit.expand,
        children: [
          searchBarUI(),
        ],
      ),
    );
  }

  Widget searchBarUI(){

    return FloatingSearchBar(
      hint: 'Search',
      openAxisAlignment: 0.0,
      axisAlignment: 0.0,
      scrollPadding: EdgeInsets.only(top:16, bottom:20),
      elevation: 4.0,
      onQueryChanged: (query){
        //Method will be here
      },
      transitionCurve: Curves.easeInOut,
      transitionDuration: Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: Duration(milliseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(icon: Icon(Icons.mic), 
          
            onPressed: (){
              print('MIC pressed');
            },),
        ),
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(icon: Icon(Icons.search), 
          
            onPressed: (){
              print('Search pressed');
            },),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],

      builder: (context, transition){
        return ClipRRect(
          child: Material(
            color: offsetWhite,
            child: Container(
              height:150,
              color: offsetWhite,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                    subtitle: Text('More info here..'),
                  )
                ]
                ),
            )
          ),
        );
      }
      
      );
  }
}