import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:canvas/list.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // backgroundColor: Colors.white,
      // body: Stack(
      //   alignment: Alignment.topCenter,
      //   children: [
      //     const Home(), // infinite height, why?
      //     Column(
      //       children: [
      //         const SearchBarUI(),
      //         const SizedBox(
      //           height: 70,
      //         ),
      //         MyStatefulWidget(),
      //       ],
      //     ),
      //   ],
      // ),
      child: Stack(
        children: [
          Home(),
          const SearchBarUI(),
          MyStatefulWidget(),
        ],
      ),
    );
  }
}

class SearchBarUI extends StatefulWidget {
  const SearchBarUI({Key? key}) : super(key: key);

  @override
  State<SearchBarUI> createState() => _SearchBarUIState();
}

class _SearchBarUIState extends State<SearchBarUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60, color: Colors.teal, child: buildFloatingSearchBar());
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

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

class ActionCards extends StatelessWidget {
  const ActionCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}
