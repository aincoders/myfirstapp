import 'package:flutter/material.dart';
import 'package:myfirstapp/all_example_practice_file/cardview.dart';
import 'package:myfirstapp/whatsapp/communities.dart';


class MyTopAppBar extends StatefulWidget{
  const MyTopAppBar({super.key});

  @override
  _MyTopAppBar createState() => _MyTopAppBar();

}

class _MyTopAppBar extends State<MyTopAppBar> {
bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Overflow Menu Example'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.connecting_airports_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCommunitiesPage()),
              );
            },
          ),
          IconButton(
            icon: Icon( isDarkMode == true? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          PopupMenuButton<int>(
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCardView()),
                  );
                  break;
                case 1:
                  // Navigate to Dashboard
                  break;
                case 2:
                  // Show More options
                  break;
                case 3:
                  // Navigate to Settings
                  break;
                case 4:
                  // Logout
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 8.0),
                    Text('Home'),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(width: 8.0),
                    Text('Dashboard'),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.more_horiz),
                    SizedBox(width: 8.0),
                    Text('More'),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8.0),
                    Text('Settings'),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 4,
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8.0),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('Content goes here'),
      ),
      ),
    );
  }
}
