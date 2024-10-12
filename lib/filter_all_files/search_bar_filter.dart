// car_parts_list_page.dart
import 'package:flutter/material.dart';
import 'package:myfirstapp/filter_all_files/search_data_list.dart';
import 'package:myfirstapp/filter_all_files/search_data_model.dart';

class CarPartsListPage extends StatefulWidget {
  @override
  _CarPartsListPageState createState() => _CarPartsListPageState();
}

class _CarPartsListPageState extends State<CarPartsListPage> {

  List<SearchDataModel> filteredList = [];
  String selectedFilter = 'All'; // Default filter option
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered list with all data
    filteredList = List.from(SearchDataModels);
  }

  void filterParts() {
    String searchText = searchController.text.toLowerCase();

    setState(() {
      filteredList = SearchDataModels.where((part) {
        bool matchesFilter = selectedFilter == 'All' || part.status == selectedFilter;
        bool matchesSearch = part.prNo.toLowerCase().contains(searchText);
        return matchesFilter && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Parts Requisition List'),
      ),
      body: Column(
        children: [
          // Filter Dropdown Menu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedFilter,
                    items: ['All', 'PENDING', 'SUBMITTED']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                        filterParts(); // Apply filter when dropdown changes
                      });
                    },
                  ),
                ),
                SizedBox(width: 8), // Add some space between dropdown and search field
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by PR No',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      filterParts(); // Apply search filter as the user types
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(filteredList[index].prNo),
                  title: Text('${filteredList[index].carCompany} ${filteredList[index].carModel}'),
                  subtitle: Text('Status: ${filteredList[index].status}\nDate: ${filteredList[index].date}'),
                  trailing: Text(
                    filteredList[index].status,
                    style: TextStyle(
                      color: filteredList[index].status == 'PENDING' ? Colors.orange : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
