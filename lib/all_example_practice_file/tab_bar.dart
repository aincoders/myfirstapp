import 'package:flutter/material.dart';
import 'package:myfirstapp/all_example_practice_file/cardview.dart';
import 'package:myfirstapp/all_example_practice_file/row_column_colour.dart';

class MyTabBarPage extends StatelessWidget {
  const MyTabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Tab Bar Page'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: "Tab 1"),
              Tab(icon: Icon(Icons.home), text: "Tab 2"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyCardView(),
            MyRowColumnColourPage(),
          ],
        ),
      ),
    );
  }
}
