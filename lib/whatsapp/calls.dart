import 'package:flutter/material.dart';

class MyCallsPage extends StatelessWidget {
  const MyCallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> callData = [
      {
        "image": "assets/images/avatar-1.png",
        "title": "Sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-2.png",
        "title": "abrar",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-3.png",
        "title": "mohammad",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-4.png",
        "title": "sakir",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-5.png",
        "title": "hasan",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-6.png",
        "title": "ali sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-7.png",
        "title": "akram",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-1.png",
        "title": "abbas",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-2.png",
        "title": "shabbir",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-3.png",
        "title": "ssss",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-4.png",
        "title": "Sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-5.png",
        "title": "Sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.call,
      },
      {
        "image": "assets/images/avatar-6.png",
        "title": "Sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
      {
        "image": "assets/images/avatar-7.png",
        "title": "Sajid",
        "subtitle": "12 August, 8:30 am",
        "phoneIcon": Icons.videocam_outlined,
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.call),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Favourites",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.green, child: Icon(Icons.favorite)),
              title: Text(
                "Add favourite",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Recent",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: callData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(callData[index]["image"]!),
                        radius: 26,
                      ),
                      title: Text(callData[index]["title"]!),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.south_west,
                              size: 18, color: Colors.red),
                          const SizedBox(width: 5),
                          Text(callData[index]["subtitle"]!),
                        ],
                      ),
                      trailing: Icon(callData[index]["phoneIcon"]!),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
            const SizedBox(
              height: 72,
            )
          ],
        ),
      ),
    );
  }
}
