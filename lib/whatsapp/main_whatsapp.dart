import 'package:flutter/material.dart';
import 'package:myfirstapp/whatsapp/calls.dart';
import 'package:myfirstapp/whatsapp/chats.dart';
import 'package:myfirstapp/whatsapp/communities.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';
import 'package:myfirstapp/whatsapp/updates.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';


class MyMainWhatsApp extends StatefulWidget {
  const MyMainWhatsApp({super.key});

  @override
  State<MyMainWhatsApp> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<MyMainWhatsApp> {
  bool isDarkMode = false;
  int currentPageIndex = 0;
  bool isSearchBar = false;


  final List<String> _titles = ['WhatsApp', 'Updates', 'Communities', 'Calls'];

  final List<Widget> _pages = <Widget>[
    const MyChatsPage(),
    const MyUpdatePage(),
    const MyCommunitiesPage(),
    const MyCallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[currentPageIndex],
            style: TextStyle(
              fontWeight:
                  currentPageIndex == 0 ? FontWeight.bold : FontWeight.normal,
              color: currentPageIndex == 0
                  ? (isDarkMode == false ? Colors.green : Colors.white)
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: _getAppBarActions(),
        ),
        body: _pages[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.green,
          animationDuration: Durations.extralong1,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.chat),
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.maps_ugc_outlined)),
              label: 'Updates',
            ),
            NavigationDestination(
              icon: Icon(Icons.groups),
              label: 'Communities',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('7'),
                child: Icon(Icons.call),
              ),
              label: 'Calls',
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getAppBarActions() {
    if (currentPageIndex == 0) {
      return <Widget>[
        IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            icon: Icon(isDarkMode == true ? Symbols.light_mode : Icons.dark_mode)),
        IconButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyErrorPage()));
          },
          icon: const Icon(
            Icons.qr_code_scanner,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyErrorPage()));
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
          ),
        ),
        PopupMenuButton<int>(
          onSelected: (value) {
            switch (value) {
              case 0:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case 3:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case 5:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 0, child: Text("New group")),
            const PopupMenuItem(value: 1, child: Text("New broadcast")),
            const PopupMenuItem(value: 2, child: Text("Linked devices")),
            const PopupMenuItem(value: 3, child: Text("Starred message")),
            const PopupMenuItem(value: 4, child: Text("Payments")),
            const PopupMenuItem(value: 5, child: Text("settings")),
          ],
        ),
      ];
    }

    if (currentPageIndex == 1) {
      return <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.qr_code_scanner,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case "status":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case "create":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
              case "settings":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: "status", child: Text("Status privacy")),
            const PopupMenuItem(value: "create", child: Text("Create channel")),
            const PopupMenuItem(value: "settings", child: Text("Settings")),
          ],
        )
      ];
    }

    if (currentPageIndex == 2) {
      return <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.qr_code_scanner,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case "settings":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                break;
            }
          },
          itemBuilder: (context) =>
              [const PopupMenuItem(value: "settings", child: Text("Settings"))],
        )
      ];
    }

    if (currentPageIndex == 3) {
      return <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.qr_code_scanner,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyErrorPage()));
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case "call_log":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyErrorPage()));
                break;
              case "settings":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyErrorPage()));
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
                value: "call_log", child: Text("Clear call log")),
            const PopupMenuItem(value: "settings", child: Text("Setting")),
          ],
        )
      ];
    } else {
      return <Widget>[];
    }
  }
}
