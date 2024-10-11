import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/order_list_all_screen/order_list_data_list.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool isSearch = true;

  final List<Map<String, dynamic>> _list = [
    {
      "product_name": "Air Filter",
      "quantity": "10 Qty",
      "status": "PENDING",
      "part_no": "161236902",
      "notes": "This is test part ",
      "car_images": "assets/images/garage-1.png",
    },
    {
      "product_name": "Oil Filter",
      "quantity": "7 Qty",
      "status": "PENDING",
      "part_no": "161236902",
      "notes": "This is test part ",
      "car_images": "assets/images/avatar-5.png",
    },
    {
      "product_name": "AC Filter",
      "quantity": "3 Qty",
      "status": "PENDING",
      "part_no": "161236902",
      "notes": "This is test part ",
      "car_images": "assets/images/garage-2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PR - 0001'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              icon: Icon(isSearch == true ? Icons.search : Icons.close)),
          PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                    break;
                }
              },
              itemBuilder: (context) =>
                  [const PopupMenuItem(value: 0, child: Text('Need help'))])
        ],
      ),
      body: ListView(
        children: [
          if (!isSearch)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Search history',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                          color: Colors.orange,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              Icon(Icons.directions_car, color: Colors.white),
                              SizedBox(width: 12),
                              Text(
                                "Hyundai - ",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "i10 - ",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Petrol",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_outlined,
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Requested Date",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "14 JUN 2024",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                       Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.query_builder_rounded,
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Due Date",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "14 JUN 2024",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                       Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.record_voice_over,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Remark",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "I think i need my break pads changed. and hear sound when i turn.",
                                    style: Theme.of(context).textTheme.bodyLarge
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                       Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.content_paste_go_rounded,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Part Requisition",
                                style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: orderListDataList.map(
                              (item) => Column(
                                children: [
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              item.productName ?? "",
                                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                                            ),
                                            const SizedBox(width: 12),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade50,
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(
                                                item.quantity ?? "",
                                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.red)

                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                textAlign: TextAlign.end,
                                                item.status ?? "",
                                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.orange)

                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                       Text("Part : ",
                                                          style: Theme.of(context).textTheme.bodyMedium
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                              item.partNo ?? "",
                                                              style: Theme.of(context).textTheme.bodyMedium

                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                       Text("Notes : ",
                                                          style: Theme.of(context).textTheme.bodyMedium
                                                      ),
                                                      Expanded(
                                                        child: Expanded(
                                                            child: Text(
                                                              item.notes ?? "",
                                                                style: Theme.of(context).textTheme.bodyMedium
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(item.carImage),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 16),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white60),
                                      child: Row(
                                        children: <Widget>[
                                           Expanded(
                                            child: Row(
                                              // Use Column for text wrapping if content grows
                                              children: [
                                                Text(
                                                  "Buying Choice : ",
                                                    style: Theme.of(context).textTheme.titleMedium
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "OEM , Third Party",
                                                      style: Theme.of(context).textTheme.bodyMedium

                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              side: const BorderSide(
                                                  color: Colors.green,
                                                  width:
                                                      0.0), // Change border color here
                                            ),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Add Quote",
                                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.green)

                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding:  EdgeInsets.symmetric(
                          horizontal: 52, vertical: 12),
                      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)
                    ),
                    child: const Text("Reject Quotation"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
