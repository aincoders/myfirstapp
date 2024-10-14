import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:myfirstapp/part_requisition/add_to_quote.dart';
import 'package:myfirstapp/part_requisition/history_order_list.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/part_requisition_all_file/part_requisition_data_model.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/part_requisition_all_file/part_requisition_list_data.dart';
import 'package:myfirstapp/part_requisition/order_list_all_screen/order_list.dart';

import '../../../filter_all_files/search_bar_filter.dart';

class PartRequisition extends StatefulWidget {
  const PartRequisition({super.key});

  @override
  State<PartRequisition> createState() => _PartRequisitionState();
}

class _PartRequisitionState extends State<PartRequisition> {
  String filter = 'All';
  String ascendingDesanding = 'All';
  List<PartRequisitionDataModel> partRequisitionDataLists = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // partRequisitionDataLists = partRequisitionDataList;
    partRequisitionDataLists = List.from(partRequisitionDataList);
  }

  void ascending_desanding() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      partRequisitionDataLists = partRequisitionDataList.where((part) {
        bool orderByFilter = filter == 'All' || part.carCompany == ascendingDesanding;
        return orderByFilter;
      }).toList();
    });
  }
  void filterParts() {
    String searchText = searchController.text.toLowerCase();
    // setState(() {
    //   partRequisitionDataLists = partRequisitionDataList.where((part) {
    //     bool matchesFilter = filter == 'All' || part.status == filter;
    //     bool matchesSearch = part.prNo.toLowerCase().contains(searchText) ||
    //         part.status.toLowerCase().contains(searchText);
    //     return matchesFilter && matchesSearch;
    //   }).toList();
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 16),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side:
                            const BorderSide(width: 0.0, color: Colors.orange)),
                    child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              "Workshop",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.orange),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: filter,
                              icon: const Icon(Icons.arrow_drop_down),
                              underline: const SizedBox(),
                              // Removes the underline
                              items: <String>[
                                'All',
                                'PENDING',
                                'SUBMITTED',
                                'ali'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  filter = value ?? "";
                                  filterParts();
                                });
                              },
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(width: 8),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side:
                            const BorderSide(width: 0.0, color: Colors.orange)),
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "Order by",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.orange),
                                ),
                                const SizedBox(width: 8),

                                DropdownButton<String>(
                                  value: ascendingDesanding,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  underline: const SizedBox(),
                                  items: <String>[
                                    'All',
                                    'Hyundai',
                                    'Suzuki',
                                    'Audi'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      ascendingDesanding = value ?? "";
                                      ascending_desanding();
                                    });
                                  },
                                ),

                                // Text("Ascending",
                                //     style:
                                //         Theme.of(context).textTheme.bodySmall),
                                // const SizedBox(width: 8),
                                // const Icon(Symbols.arrow_drop_down)
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 24,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  "With",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.orange),
                                ),
                                const SizedBox(width: 8),
                                Text("Due Date",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const SizedBox(width: 8),
                                const Icon(Symbols.arrow_drop_down)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search Orders',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          filterParts(); // Apply search filter as the user types
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarPartsListPage()));
                      },
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.orange,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.outbound_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Requested",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddToQuote()));
                      },
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.green,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_down,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Items Quoted",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                    Text(
                                      "05",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OrderList()));
                      },
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Items Rejected",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      child: Text("Open Requist",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold))),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HistoryOrderList()));
                    },
                    child: Row(
                      children: [
                        Text("History",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.orange)),
                        const Icon(Icons.keyboard_arrow_right,
                            color: Colors.orange)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            partRequisitionDataLists.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: partRequisitionDataLists.length,
                    itemBuilder: (context, index) {
                      final item = partRequisitionDataLists[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.prNo!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.red),
                                ),
                                const SizedBox(width: 4),
                                const Text("-"),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    item.status,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: item.status == "PENDING"
                                                ? Colors.orange
                                                : Colors.green),
                                  ),
                                ),
                                const Badge(
                                  label: Text("5"),
                                  child: Icon(Icons.question_answer_outlined),
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.directions_car_outlined,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "${item.carCompany}, ${item.carModel}, ${item.carFuel}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                const SizedBox(
                                  width: 26,
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Due Date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.red),
                                ),
                                const SizedBox(width: 4),
                                const Text(":"),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    item.date!,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Container(
                              margin: const EdgeInsets.only(right: 32),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.record_voice_over,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      item.notes!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Card(
                                color: Colors.yellow.shade100,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Requested item",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(":"),
                                      Expanded(
                                        child: Text(
                                          " ${item.item_1}, ${item.item_2}, ${item.item_3}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    })
                : Center(
                    child: Text(
                      "Data Not Found !!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
