import 'package:flutter/material.dart';
import 'package:myfirstapp/all_example_practice_file/cardview.dart';
import 'package:myfirstapp/whatsapp/chats.dart';
import 'package:myfirstapp/whatsapp/communities.dart';


class MyTopAppBarMenuPage extends StatelessWidget {
  const MyTopAppBarMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar with Icons and Text'),
        actions: [
          _buildIconWithText(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCardView()),
              );
            },
          ),
          _buildIconWithText(
            icon: Icons.search,
            label: 'Search',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChatsPage()),
              );
            },
          ),
          _buildIconWithText(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCardView()),
              );
            },
          ),
          _buildIconWithText(
            icon: Icons.notifications,
            label: 'Notifications',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCommunitiesPage()),
              );
            },
          ),
          IconButton(
              icon: Icon(Icons.connecting_airports_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCommunitiesPage()),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'More':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyChatsPage()),
                  );
                  break;
                case 'Help':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyCardView()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'More',
                  child: ListTile(
                    leading: Icon(Icons.more_vert),
                    title: Text('More'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Help',
                  child: ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Main Screen'),
      ),
    );
  }

  Widget _buildIconWithText({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(icon),
          Text(
            label,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}