import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';
import 'package:canvas/classes.dart';
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
              return Container(height: 30, color: color);
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: litems.length,
        itemBuilder: (BuildContext context, int index){  
        return Column(
        children: <Widget>[
          Container(
            height: 50.0,
          ),
          CheckboxListTile(
          title: Text(litems[index].tasktitle),
          subtitle: Text(litems[index].tasksub),
          tileColor: const Color(0xFF84ddc4),
          checkColor: Color(0xFFFFFFFF),
          activeColor: Color(0xFF045e45),
          value: litems[index].isComplete,
          onChanged: (bool? value) {
            setState(() {
              litems[index].isComplete = value!;
            });
          },
          secondary: litems[index].taskicon,
        ),
        ],
      );
      }),
    );
  }
}

List<Task> litems = [
  Task(tasktitle: 'Change Laptop settings',
  tasksub: 'Ensuring that your computers and monitors are turned off',
  taskicon: const Icon(Icons.laptop)),
  Task(tasktitle: 'Carpooling',
  tasksub: 'Instead of driving solo, carpool and save money & the planet',
  taskicon: const Icon(Icons.car_repair))
];
