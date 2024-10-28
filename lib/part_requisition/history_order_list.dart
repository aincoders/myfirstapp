import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/part_requisition_all_file/part_requisition_list_data.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

import 'main_home_part_requisition/part_requisition_all_file/part_requisition_data_model.dart';

class HistoryOrderList extends StatefulWidget {
  const HistoryOrderList({super.key});

  @override
  State<HistoryOrderList> createState() => _HistoryOrderListState();
}

class _HistoryOrderListState extends State<HistoryOrderList> {
  bool isSearchOn = true;
  bool isFilter = true;

  String filter = 'All';
  String filterAscendingDesanding = 'All';
  List<PartRequisitionDataModel> partRequisitionDataLists = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // partRequisitionDataLists = partRequisitionDataList;
    partRequisitionDataLists = List.from(partRequisitionDataList);
  }

  void filterParts() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      partRequisitionDataLists = partRequisitionDataList.where((part) {
        bool matchesFilter = filter == 'All' || part.status == filter;
        bool matchesSearch = part.prNo.toLowerCase().contains(searchText) ||
            part.status.toLowerCase().contains(searchText);
        return matchesFilter && matchesSearch;
      }).toList();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchOn = !isSearchOn;
                  isFilter = !isFilter;
                });
              },
              icon: Icon(
                  isSearchOn == true ? Icons.search : Icons.close_outlined)),
          PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyErrorPage()));
                    break;
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Text("Need help"),
                    )
                  ])
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          if (!isSearchOn) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Search history',
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
          ],
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
                      side: const BorderSide(width: 0.0, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                "Order by",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),

                              // DropdownButton(
                              //     value: filter,
                              //     icon: const Icon(Icons.arrow_drop_down),
                              //     underline: const SizedBox(),
                              //     items:<String>[
                              //   'ali',
                              // 'sajid',
                              // 'mohammad'
                              // ].map((String value){
                              //   return DropdownMenuItem<String>(value: value, child: Text(value));
                              // }).toList(), onChanged: (value) {
                              //       setState(() {
                              //         filter = value ?? "";
                              //         filterParts();
                              //       });
                              // }),


                              Text("Ascending",
                                  style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(width: 8),
                              const Icon(Symbols.arrow_drop_down)
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 24,
                          color: Colors.grey,
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
                                    ?.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),
                              Text("Due Date",
                                  style: Theme.of(context).textTheme.bodySmall),
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
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: partRequisitionDataLists.length,
                    itemBuilder: (context, index) {
                      final item = partRequisitionDataLists[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Card(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.grey, width: 0.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item.prNo,
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
                                      child:
                                          Icon(Icons.question_answer_outlined),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
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
                                        item.date,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  margin: const EdgeInsets.only(right: 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.record_voice_over,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          item.notes,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
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
                                              "${item.item_1}, ${item.item_2}, ${item.item_3}",
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
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
