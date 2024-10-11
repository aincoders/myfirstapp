import 'package:flutter/material.dart';

class MyDrawerPage extends StatelessWidget{
  const MyDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/garage-2.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ali Sajid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("Flutter"),
              leading: Icon(Icons.holiday_village),
            ),
            Divider(
            ),
            ListTile(
              title: Text("Home"),
            ),  ListTile(
              title: Text("More"),
            ),
            ListTile(
              title: Text("Salary"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Drawer Page"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
    );

  }


}