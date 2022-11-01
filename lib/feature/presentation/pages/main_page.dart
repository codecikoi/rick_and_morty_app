import 'package:flutter/material.dart';

import '../widgets/custom_delegate.dart';
import '../widgets/persons_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                  context: context, delegate: CustomSearchDelegate()),
              icon: Icon(Icons.search)),
        ],
      ),
      body: PersonsList(),
    );
  }
}
