import 'package:flutter/material.dart';

import 'filter_data_model.dart';


class CarPartListScreen extends StatefulWidget {
  @override
  _CarPartListScreenState createState() => _CarPartListScreenState();
}

class _CarPartListScreenState extends State<CarPartListScreen> {
  // List of car parts
  List<CarPart> carParts = [
    CarPart(partNumber: 'PN001', carName: 'Toyota', status: 'Pending'),
    CarPart(partNumber: 'PN002', carName: 'Honda', status: 'Submit'),
    CarPart(partNumber: 'PN003', carName: 'BMW', status: 'Pending'),
    CarPart(partNumber: 'PN004', carName: 'Audi', status: 'Submit'),
    CarPart(partNumber: 'PN005', carName: 'Ford', status: 'Pending'),
    CarPart(partNumber: 'PN006', carName: 'Chevrolet', status: 'Submit'),
    CarPart(partNumber: 'PN007', carName: 'Mazda', status: 'Pending'),
    CarPart(partNumber: 'PN008', carName: 'Tesla', status: 'Submit'),
    CarPart(partNumber: 'PN009', carName: 'Hyundai', status: 'Pending'),
    CarPart(partNumber: 'PN010', carName: 'Kia', status: 'Submit'),
    CarPart(partNumber: 'PN011', carName: 'Lexus', status: 'Pending'),
    CarPart(partNumber: 'PN012', carName: 'Mercedes', status: 'Submit'),
    CarPart(partNumber: 'PN013', carName: 'Nissan', status: 'Pending'),
    CarPart(partNumber: 'PN014', carName: 'Porsche', status: 'Submit'),
    CarPart(partNumber: 'PN015', carName: 'Ferrari', status: 'Pending'),
    CarPart(partNumber: 'PN016', carName: 'Lamborghini', status: 'Submit'),
    CarPart(partNumber: 'PN017', carName: 'Bugatti', status: 'Pending'),
    CarPart(partNumber: 'PN018', carName: 'Volvo', status: 'Submit'),
    CarPart(partNumber: 'PN019', carName: 'Jaguar', status: 'Pending'),
    CarPart(partNumber: 'PN020', carName: 'Land Rover', status: 'Submit'),
  ];

  // List for filtered data
  List<CarPart> filteredCarParts = [];

  // Current filter value
  String filter = 'All';

  @override
  void initState() {
    super.initState();
    filteredCarParts = carParts; // Initialize with all items
  }

  // Function to filter the list
  void filterCarParts(String status) {
    setState(() {
      if (status == 'All') {
        filteredCarParts = carParts;
      } else {
        filteredCarParts = carParts.where((part) => part.status == status).toList();
      }
      filter = status; // Update the filter value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Parts List'),
      ),
      body: Column(
        children: [
          // Dropdown for filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: filter,
              icon: Icon(Icons.arrow_downward),
              items: <String>['All', 'Submit', 'Pending'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                filterCarParts(newValue!); // Filter the list when a new value is selected
              },
            ),
          ),

          // ListView to display the car parts
          Expanded(
            child: ListView.builder(
              itemCount: filteredCarParts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(filteredCarParts[index].partNumber),
                    subtitle: Text(filteredCarParts[index].carName),
                    trailing: Text(
                      filteredCarParts[index].status,
                      style: TextStyle(
                        color: filteredCarParts[index].status == 'Pending'
                            ? Colors.yellow
                            : Colors.green,
                      ),
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