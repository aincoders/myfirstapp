import 'package:flutter/material.dart';
import 'package:myfirstapp/api_calling/demo_api_calling/second_demo_api_data_model.dart';
import 'package:myfirstapp/api_calling/demo_api_calling/second_demo_try_catch_api.dart';

class SecondDemoApiCalling extends StatefulWidget {
  const SecondDemoApiCalling({super.key});

  @override
  State<SecondDemoApiCalling> createState() => _SecondDemoApiCallingState();
}

class _SecondDemoApiCallingState extends State<SecondDemoApiCalling> {
  late Future<List<SecondDemoApiDataModel>> secondDemo;
  List<SecondDemoApiDataModel> secondDemoList = [];
  List<SecondDemoApiDataModel> allList = [];
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    secondDemo = getSecondDemo();
    secondDemo.then((data) {
      setState(() {
        secondDemoList = data;
        allList = data;
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
          secondDemoList =
              allList.where((photo) => photo.id == searchId).toList();
        } else {
          secondDemoList = allList
              .where((photo) =>
                  photo.title != null &&
                  photo.title!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        secondDemoList = allList; // Reset list if query is empty
      }
    });
  }

  Future<void> removeItem(int? id) async {
    deleteSecondDemo(id).then((result) {
      if (result != null) {
        if (result == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('success to delete item from server.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete item from server.')),
          );
        }
      }
    });
  }

  Future<void> addItem(int? id) async {
    deleteSecondDemo(id).then((result) {
      if (result != null) {
        if (result == 500) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('success to delete item from server.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete item from server.')),
          );
        }
      }
    });
  }

  // if (id == null) return;
  // final response =
  //     await http.delete(Uri.parse('https://fakestoreapi.com/products/6'));
  //
  // if (response.statusCode == 200) {
  //   setState(() {
  //     secondDemoList.removeWhere((photo) => photo.id == id);
  //     allList.removeWhere((photo) => photo.id == id);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('success to delete item from server.')),
  //     );
  //   });
  // } else {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Failed to delete item from server.')),
  //   );
  // }

  // void removeItem(int? id) {
  //   if(id == null) return;
  //   setState(() {
  //     secondDemoList.removeWhere((photo)=> photo.id == id);
  //     allList.removeWhere((photo)=> photo.id == id);
  //   });
  // }

  void clearText1() {
    setState(() {
      _controller1.clear();
      searchItem('');
    });
  }

  void clearText2() {
    setState(() {
      _controller2.clear();
    });
  }

  void clearText3() {
    setState(() {
      _controller3.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Demo Api'),
      ),
      body: Column(
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
                      onPressed: clearText1,
                      icon: const Icon(Icons.cancel),
                    ),
                ],
              ),
            ),
          ),
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
                    child: const Icon(Icons.person_outline_outlined),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controller2,
                      decoration: const InputDecoration(
                        hintText: 'User Name',
                        border: InputBorder.none,
                      ),
                      // onChanged: searchItem,
                    ),
                  ),
                  // if (_controller2.text.isNotEmpty)
                  IconButton(
                    onPressed: clearText2,
                    icon: const Icon(Icons.cancel),
                  ),
                ],
              ),
            ),
          ),
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
                    child: const Icon(Icons.email),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controller3,
                      decoration: const InputDecoration(
                        hintText: 'Email Id',
                        border: InputBorder.none,
                      ),
                      // onChanged: searchItem,
                    ),
                  ),
                  // if (_controller3.text.isNotEmpty)
                  IconButton(
                    onPressed: clearText3,
                    icon: const Icon(Icons.cancel),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text('Submitted'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 18),
              )),
          Expanded(
              child: FutureBuilder<List<SecondDemoApiDataModel>>(
                  future: secondDemo,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: secondDemoList.length,
                        itemBuilder: (context, index) {
                          final photos = secondDemoList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'ID: ${photos.id}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => removeItem(photos.id),
                                        icon: const Icon(Icons.cancel_outlined),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      height: 150,
                                      width: 150,
                                      child: Image.network(
                                        photos.image ??
                                            "", // Null check directly here
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Price: ${photos.price.toString() ?? ''}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ]),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Title: ${photos.title.toString() ?? ''}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
