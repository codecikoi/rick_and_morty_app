import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');
  final _suggestions = [
    'Rick',
    'Morty',
    'Summer',
    'Jerry',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_outlined),
    );
  }
}
