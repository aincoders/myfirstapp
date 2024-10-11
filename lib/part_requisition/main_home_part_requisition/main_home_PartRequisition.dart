import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/bill.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/part_purchase.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/part_requisition_all_file/part_requisition.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class MainHomePartRequisition extends StatefulWidget {
  const MainHomePartRequisition({super.key});

  @override
  State<MainHomePartRequisition> createState() =>
      _MainHomePartRequisitionState();
}

class _MainHomePartRequisitionState extends State<MainHomePartRequisition> {
  int currentPageIndex = 0;

  final List<String> _titles = ["Home", "Part Purchase", "Bill"];
  final List<Widget> _pages = <Widget>[
    const PartRequisition(),
    const PartPurchase(),
    const Bill()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[currentPageIndex]),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Badge(
                label: Text('5'),
                child: Icon(Icons.notifications),
              )),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar-1.png'),
            radius: 16,
          ),
          PopupMenuButton<int>(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                    break;
                }
              },
              itemBuilder: (context) =>
                  [const PopupMenuItem(value: 0, child: Text('Need Help'))])],),
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        elevation: 5,
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.assessment), label: "Part Requisition"),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Part Purchase"),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: "Bill"),
        ],
      ),
    );
  }
}
