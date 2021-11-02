import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isBarEmpty = true;
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        setState(() {
          searchText = text;
          isBarEmpty = text.isEmpty;
        });
      },
      decoration: InputDecoration(
          hintText: "Search Product",
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                if (!isBarEmpty) {
                  _search();
                }
              },
              icon: const Icon(Icons.search))),
    );
  }

  void _search() {}
}
