import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomePage()
        );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: SizedBox(
              height: 50,
              //child: Image.asset(logoAsset),
            ),
            bottom: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1000,
                    height: 40,
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Search for something',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.mic)),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_alt_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}