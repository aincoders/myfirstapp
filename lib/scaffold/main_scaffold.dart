import 'package:flutter/material.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class MyMainScaffold extends StatelessWidget {
  const MyMainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Scaffold Page'),
      ),
      body: const Center(
        child: Text("Hello scaffold"),
      ),

      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: 1,
      //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //   destinations: const [
      //     NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
      //     NavigationDestination(icon: Icon(Icons.more_horiz), label: "more"),
      //     NavigationDestination(icon: Icon(Icons.settings), label: "setting")
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Dummy',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
        splashColor: Colors.lightBlue,
     highlightElevation:50,
        hoverElevation: 100,
        hoverColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Ali Sajid"),
              accountEmail: Text("sajidhusain140105@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("Ali"),
              ),
            ),
            ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyErrorPage()));
              },
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home_filled),
            ),
            const ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.dashboard),
            ),
            const ListTile(
              title: Text("More"),
              leading: Icon(Icons.more_vert_outlined),
            )
          ],
        ),
      ),
    );
  }
}
