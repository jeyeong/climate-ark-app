import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';


void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: const [
            Expanded(child: SearchBarUI()),
            
          ],
        )
      ),
    );
  }
}

class SearchBarUI extends StatefulWidget {
  const SearchBarUI({ Key? key }) : super(key: key);

  @override
  State<SearchBarUI> createState() => _SearchBarUIState();
}

class _SearchBarUIState extends State<SearchBarUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MyApp(),
          buildFloatingSearchBar(),
          // Background()
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return FloatingSearchBar(
    hint: 'Search...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    //width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.place),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Colors.accents.map((color) {
              return Container(height: 30, color: Colors.white);
            }).toList(),
          ),
        ),
      );
    },
  );
}
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: offsetWhite,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
              child: MyStatefulWidget(),   
          ),
        ),
      ),
    );
  }
}

