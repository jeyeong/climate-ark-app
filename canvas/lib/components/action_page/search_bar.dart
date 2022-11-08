import 'package:flutter/material.dart';

import 'package:canvas/data.dart';
import 'package:canvas/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.updateSearchQuery,
  }) : super(key: key);

  final Function updateSearchQuery;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: const BoxDecoration(
          color: offsetWhite,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                widget.updateSearchQuery('');
                clearText();
              },
            ),
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (string) {
            widget.updateSearchQuery(string);
          },
          controller: fieldText,
        ),
      ),
    );
  }
}
