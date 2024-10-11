import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyUpdatePage extends StatefulWidget{
  const MyUpdatePage({super.key});

  @override
 State<MyUpdatePage>  createState() => _MyUpdatesPage();

}



class _MyUpdatesPage extends State<MyUpdatePage> {
  bool isSearchBar = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> horizontalCardData = [
      {"image": "assets/images/avatar-1.png", "name": "sajid ali"},
      {"image": "assets/images/avatar-2.png", "name": "mohammada ali"},
      {"image": "assets/images/avatar-3.png", "name": "abrar"},
      {"image": "assets/images/avatar-4.png", "name": "khadim husain"},
      {"image": "assets/images/avatar-5.png", "name": "hasan abbas"},
      {"image": "assets/images/avatar-6.png", "name": "shabbir abbas"},
      {"image": "assets/images/avatar-7.png", "name": "zakir husain"},
    ];

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: FloatingActionButton(
                tooltip: 'Camera',
                backgroundColor: Colors.green,
                onPressed: () {},
                child: const Icon(Icons.camera_alt_sharp)),
          ),
          Positioned(
            bottom: 70.0,
            right: 4.0,
            child: FloatingActionButton.small(
                tooltip: 'New Text Status',
                onPressed: () {},
                child: const Icon(
                  Icons.edit,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const ListTile(
              leading: Stack(
                clipBehavior: Clip.none, // Ensure the icon is not clipped
                children: [
                   CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar-1.png"),
                    radius: 30.0,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 24.0,
                        ),),
                ],
              ),
              title: Text(
                "My status",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Tap to add status update"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Expanded(
                      child: Text("Viewed updates",
                          style: TextStyle(fontWeight: FontWeight.w500))),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Expanded(
                      child: Text("Channels",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500))),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey.shade500,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text('Explore'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Stay updated on topics that matter to you. Find channels to follow below",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: horizontalCardData.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 180,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 6,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        horizontalCardData[index]["image"]!),
                                    radius: 34,
                                  ),
                                  const Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Icon(Icons.verified,color: Colors.lightBlue,))
                                ],
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                  horizontalCardData[index]['name']!,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green.shade700,
                                    textStyle: const TextStyle(fontSize: 14),
                                  ),
                                  child: const Text('Follow'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Explore more'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
