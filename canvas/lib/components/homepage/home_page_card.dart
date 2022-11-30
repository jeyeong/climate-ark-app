import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

import 'package:canvas/data.dart';
import 'package:canvas/utils/completionHandlers.dart';

class HomeImage extends StatefulWidget {
  const HomeImage({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final String imageFile;

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage(widget.imageFile),
            ),
          ),
        ));
  }
}

class HomeText extends StatefulWidget {
  const HomeText({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  final String name;
  final String description;

  @override
  State<HomeText> createState() => _HomeTextState();
}

class _HomeTextState extends State<HomeText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Text(
              widget.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.description,
              style: TextStyle(
                color: lightGrey,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButtons extends StatefulWidget {
  final int actionID;
  final bool completed;
  final String completedStamp;
  final Function addCompletedAction;

  const HomeButtons({
    Key? key,
    required this.actionID,
    required this.completed,
    required this.completedStamp,
    required this.addCompletedAction,
  }) : super(key: key);

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  Container generateCompletedButton() {
    if (widget.completed) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: primaryDarkColor,
          ),
          child: ListTile(
            leading: const Icon(Icons.check, color: primaryLightColor),
            title: const Text('Completed',
                style: TextStyle(
                    color: primaryLightColor, fontWeight: FontWeight.bold)),
            onTap: () {
              widget.addCompletedAction(widget.actionID);
            },
          ));
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color.fromARGB(255, 209, 244, 217),
        ),
        child: ListTile(
          leading: const Icon(Icons.check, color: primaryDarkColor),
          title: const Text('Complete',
              style: TextStyle(
                  color: primaryDarkColor, fontWeight: FontWeight.bold)),
          onTap: () {
            widget.addCompletedAction(widget.actionID);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: generateCompletedButton(),
            ),
            const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 10,
                )),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color.fromARGB(255, 255, 191, 201),
                ),
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                  color: Colors.red,
                  highlightColor: Colors.redAccent.shade100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCard extends StatefulWidget {
  const HomePageCard({
    Key? key,
    required this.action,
    required this.completed,
    required this.completedStamp,
    required this.addCompletedAction,
  }) : super(key: key);

  final CarbonAction action;
  final bool completed;
  final String completedStamp; // used for the DB to mark as completed
  final Function addCompletedAction;

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          width: 400.0,
          height: 500.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 50,
            shadowColor: primaryDarkestColor,
            color: offsetWhite,
            child: SizedBox(
              width: 400,
              height: 520,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeImage(imageFile: 'assets/images/laptop.jpg'),
                  Expanded(
                    flex: 1,
                    child: HomeText(
                      name: widget.action.actionName,
                      description: widget.action.actionDescription,
                    ),
                  ),
                  HomeButtons(
                    actionID: widget.action.id,
                    completed: widget.completed,
                    completedStamp: widget.completedStamp,
                    addCompletedAction: widget.addCompletedAction,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
