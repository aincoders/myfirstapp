import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/main_home_PartRequisition.dart';
import 'package:myfirstapp/scaffold/main_scaffold.dart';
import 'package:myfirstapp/scaffold/top_app_bar.dart';
import 'package:myfirstapp/whatsapp/main_whatsapp.dart';

import '../api_calling/country_list_screen.dart';
import '../api_calling/photo_dummy_api.dart';
import '../filter_all_files/filter.dart';
import 'alert_dailogs.dart';

class MyButtonPage extends StatefulWidget {
  const MyButtonPage({super.key});

  @override
  State<MyButtonPage> createState() => _MyButtonPageState();
}

class _MyButtonPageState extends State<MyButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Button Page"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyMainScaffold()),
            );
          },
          child: const Icon(Icons.add),
        ),
        persistentFooterButtons: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyMainWhatsApp()),
                );
              },
              child: const Text("Go Bottom Nav"))
        ],
        primary: false,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
                child: OutlinedButton(
                  child: const Text(
                    'Next Page',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  PhotoListScreen()),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountryListScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('My Scaffold Page'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarPartListScreen(),
                        ));
                  },
                  child: const Text("Light Dark Mode"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: CloseButton(
                  onPressed: () {},
                ),
              ),
              CircleAvatar(
                radius: 31,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MainHomePartRequisition()),
                    );
                  },
                  icon: const Icon(
                    Icons.construction,
                    size: 40,
                  ),
                ),
              ),
            ])));
  }
}
