import 'package:flutter/material.dart';
import 'package:myfirstapp/api_calling/photo_dummy_api_data_model.dart';
import 'api_try_file.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<PhotoInfo>> photoListFuture;

  @override
  void initState() {
    super.initState();
    photoListFuture = fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List'),
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
                        decoration: const InputDecoration(
                          hintText: 'Search Orders',
                          border: InputBorder.none,
                        ),
                        // onChanged: (value) {
                        //   filterParts(); // Apply search filter as the user types
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            FutureBuilder<List<PhotoInfo>>(
              future: photoListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  final photoList = snapshot.data!;
                  return Expanded( // Wrap ListView.builder in Expanded
                    child: ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        final photo = photoList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                height: 150,
                                width: 150,
                                child: Image.network(
                                  photo.image ?? "", // Null check directly here
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16), // Space between image and text column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      photo.id.toString(),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8), // Space between text
                                    Text(
                                      photo.title ?? "", // Null check directly here
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 8), // Space between text
                                    Text(
                                      photo.category ?? "", // Null check directly here
                                      style: TextStyle(fontSize: 14),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),

    );
  }
}
