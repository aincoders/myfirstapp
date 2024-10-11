import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/setting/company_profile.dart';
import 'package:myfirstapp/part_requisition/setting/tax_information.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class MainSettingPartRequisition extends StatefulWidget {
  const MainSettingPartRequisition({super.key});

  @override
  State<MainSettingPartRequisition> createState() =>
      _MainSettingPartRequisitionState();
}

class _MainSettingPartRequisitionState
    extends State<MainSettingPartRequisition> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Setting"),
          actions: [
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
                    [const PopupMenuItem(value: 0, child: Text("need help"))])
          ],
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            tabs: [Tab(text: "Company Profile"), Tab(text: "Tax Information")],
          ),
        ),
        body: const TabBarView(
          children: [CompanyProfile(), TaxInformation()],
        ),
      ),
    );
  }
}
