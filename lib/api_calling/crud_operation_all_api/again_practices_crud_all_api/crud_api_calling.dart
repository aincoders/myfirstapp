import 'package:flutter/material.dart';
import 'package:myfirstapp/api_calling/crud_operation_all_api/again_practices_crud_all_api/crud_api_services_file.dart';

import 'crud_api_data_model.dart';

class CrudApiCalling extends StatefulWidget {
  const CrudApiCalling({super.key});

  @override
  State<CrudApiCalling> createState() => _CrudApiCallingState();
}

class _CrudApiCallingState extends State<CrudApiCalling> {
  List<CrudApiDataModel> _list = [];
  final CrudApiServicesFile _apiCalling = CrudApiServicesFile();

  @override
  void initState() {
    super.initState();
    debugPrint("get---->>---calling");

    _getInfo();
  }

  Future<void> _getInfo() async {
    try {
      final info = await _apiCalling.getUserInfo();
      setState(() {
        _list = info;
      });
    } catch (e) {
      setState(() {
        debugPrint("Error fetching info: $e");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD Api'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: _list.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator()) // Loading indicator
                  : ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        final item = _list[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: ${item.user_name ?? ""}'),
                                        Text('Email: ${item.user_email ?? ""}'),
                                        Text(
                                            'Phone no: ${item.user_phonenumber ?? ""}'),
                                        Text(
                                            'Address: ${item.user_address ?? ""}'),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.cancel,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }
}
