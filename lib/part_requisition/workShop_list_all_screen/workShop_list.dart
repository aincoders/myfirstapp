import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/workShop_list_all_screen/workshop_list_data_list.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class WorkshopList extends StatefulWidget {
  const WorkshopList({super.key});

  @override
  State<WorkshopList> createState() => _WorkshopListState();
}

class _WorkshopListState extends State<WorkshopList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop List'),
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
                [const PopupMenuItem(value: 0, child: Text('Need help'))],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search sistory',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              itemCount: workShopListData.length,
              itemBuilder: (context, index) {
                final item = workShopListData[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                        side: const BorderSide(
                            color: Colors.grey, width: 0.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item.image),
                          radius: 28,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(item.title!,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.phoneNo!,
                                  style: Theme.of(context).textTheme.labelLarge),
                              const SizedBox(height: 2.0),
                              Text(item.address!,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
