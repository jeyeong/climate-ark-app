import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class HomeImage extends StatefulWidget {
  const HomeImage({Key? key}) : super(key: key);

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: const Image(
          image: AssetImage('assets/laptop.jpg'),
        ),
      ),
    ));
  }
}

class HomeText extends StatefulWidget {
  const HomeText({Key? key}) : super(key: key);

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
          children: const [
            Text(
              "Change Laptop Settings",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ensuring that your computers and monitors are turned off.",
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
  const HomeButtons({Key? key}) : super(key: key);

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: ListTile(
                  tileColor: primaryLightColor,
                  leading: Icon(Icons.check, color: primaryColor),
                  title: Text('Complete'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () {},
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
  const HomePageCard({Key? key}) : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 550,
            child: Column(
              children: const [
                HomeImage(),
                HomeText(),
                HomeButtons(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
