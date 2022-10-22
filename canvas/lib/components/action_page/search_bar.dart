import 'dart:html';

import 'package:canvas/main.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon:
                IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
            hintText: 'Search',
            border: InputBorder.none),
      ),
    );
  }
}
