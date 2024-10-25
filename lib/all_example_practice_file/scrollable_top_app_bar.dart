import 'package:flutter/material.dart';

class HideAppBarOnScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('My AppBar'),
            floating: true, // App bar hides on scroll down
            snap: true, // App bar appears quickly on scroll up
            pinned: false, // App bar will not stick at the top
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.network(
            //     'https://via.placeholder.com/400',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 50, // Number of list items
            ),
          ),
        ],
      ),
    );
  }
}