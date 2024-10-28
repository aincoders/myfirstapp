import 'package:flutter/material.dart';
import 'package:myfirstapp/api_calling/demo_api_calling/demo_try_catch_api.dart';
import 'demo_api_data_model.dart';

class DemoApiCalling extends StatefulWidget {
  const DemoApiCalling({super.key});

  @override
  State<DemoApiCalling> createState() => _DemoApiCallingState();
}

class _DemoApiCallingState extends State<DemoApiCalling> {
  late Future<List<DemoApiDataModel>> photoListFuture;
  final TextEditingController _controller1 = TextEditingController();
  List<DemoApiDataModel> allPhotos = [];
  List<DemoApiDataModel> filteredPhotos = [];

  @override
  void initState() {
    super.initState();
    photoListFuture = getPhotos();
    photoListFuture.then((data) {
      setState(() {
        allPhotos = data;
        filteredPhotos = data;
      });
    });
    _controller1.addListener(() {
      setState(() {});
    });
  }

  void searchItem(String query) {
    setState(() {
      if (query.isNotEmpty) {
        final int? searchId = int.tryParse(query);
        if (searchId != null) {
          // Filter the list by ID
          filteredPhotos = allPhotos.where((photo) => photo.id == searchId).toList();
        } else {
          filteredPhotos = allPhotos; // Show all if query is invalid
        }
      } else {
        filteredPhotos = allPhotos; // Reset list if query is empty
      }
    });
  }

  // Remove an item permanently from both lists
  void removeItem(int? id) {
    if (id == null) return; // Exit if id is null
    setState(() {
      allPhotos.removeWhere((photo) => photo.id == id);
      filteredPhotos.removeWhere((photo) => photo.id == id);
    });
  }


  void _clearAllFields() {
    _controller1.clear();
    setState(() {
      filteredPhotos = allPhotos; // Show all items on clearing search
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo API'),
      ),
      body: Column(
        children: [
          // Search bar with a cancel icon
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
                      controller: _controller1,
                      decoration: const InputDecoration(
                        hintText: 'Search by ID',
                        border: InputBorder.none,
                      ),
                      onChanged: searchItem,
                    ),
                  ),
                  if (_controller1.text.isNotEmpty)
                    IconButton(
                      onPressed: _clearAllFields,
                      icon: const Icon(Icons.cancel),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DemoApiDataModel>>(
              future: photoListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: filteredPhotos.length,
                    itemBuilder: (context, index) {
                      final photo = filteredPhotos[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'ID: ${photo.email}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => removeItem(photo.id),
                                    icon: const Icon(Icons.cancel_outlined),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                photo.name.toString() ?? '',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                photo.email ?? '',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
