// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myfirstapp/scaffold/top_app_bar.dart';
import 'package:myfirstapp/all_example_practice_file/swiper_slider.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';


class MyBottomNavigationBarPage extends StatefulWidget {
  const MyBottomNavigationBarPage({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyBottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyErrorPage(),
    const MySwiperSliderPage(),
    const MyTopAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
