import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class ExampleSwipe extends StatefulWidget {
  @override
  _ExampleSwipeState createState() => _ExampleSwipeState();
}

class _ExampleSwipeState extends State<ExampleSwipe>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/hero.png",
    "assets/carpool.jpg",
    "assets/laptop.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: new TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.7,
            maxHeight: MediaQuery.of(context).size.width * 0.7,
            minWidth: MediaQuery.of(context).size.width * 0.6,
            minHeight: MediaQuery.of(context).size.width * 0.6,
            cardBuilder: (context, index) => Card(
              child: Image.asset('${welcomeImages[index]}'),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}
