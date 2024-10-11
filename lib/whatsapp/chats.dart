import 'package:flutter/material.dart';

class MyChatsPage extends StatelessWidget {
  const MyChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardData = [
      {
        "title": "Sajid Husain",
        "subtitle": "Assalamualaikum",
        "time": "12:00 PM",
        "image": "assets/images/avatar-1.png"
      },
      {
        "title": "Abrar",
        "subtitle": "ok",
        "time": "12:00 PM",
        "image": "assets/images/avatar-2.png"
      },
      {
        "title": "Mohammad Ali",
        "subtitle": "Hi",
        "time": "12:00 PM",
        "image": "assets/images/avatar-3.png"
      },
      {
        "title": "Nizamuddin Patel",
        "subtitle": "Typing",
        "time": "12:00 PM",
        "image": "assets/images/avatar-4.png"
      },
      {
        "title": "Hasan Abbas",
        "subtitle": "Hello",
        "time": "12:00 PM",
        "image": "assets/images/avatar-5.png"
      },
      {
        "title": "Mikdad Husain",
        "subtitle": "hmm",
        "time": "12:00 PM",
        "image": "assets/images/avatar-6.png"
      },
      {
        "title": "Shabbir Ali",
        "subtitle": "No",
        "time": "12:00 PM",
        "image": "assets/images/avatar-7.png"
      },
      {
        "title": "Sajid Husain",
        "subtitle": "Assalamualaikum",
        "time": "12:00 PM",
        "image": "assets/images/avatar-1.png"
      },
      {
        "title": "Abrar",
        "subtitle": "ok",
        "time": "12:00 PM",
        "image": "assets/images/avatar-2.png"
      },
      {
        "title": "Mohammad Ali",
        "subtitle": "Hi",
        "time": "12:00 PM",
        "image": "assets/images/avatar-3.png"
      },
      {
        "title": "Nizamuddin Patel",
        "subtitle": "Typing",
        "time": "12:00 PM",
        "image": "assets/images/avatar-4.png"
      },
      {
        "title": "Hasan Abbas",
        "subtitle": "Hello",
        "time": "12:00 PM",
        "image": "assets/images/avatar-5.png"
      },
      {
        "title": "Mikdad Husain",
        "subtitle": "hmm",
        "time": "12:00 PM",
        "image": "assets/images/avatar-6.png"
      },
      {
        "title": "Shabbir Ali",
        "subtitle": "No",
        "time": "12:00 PM",
        "image": "assets/images/avatar-7.png"
      },
    ];

    Future<void> refreshChatList() async {
      // Simulate a network request or data fetching process
      await Future.delayed(const Duration(seconds: 2));

      // For demonstration, shuffle the list or update it with new data
      // setState(() {
      //   _cardData.shuffle();
      // });
    }

    return Scaffold(
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: FloatingActionButton(
                  tooltip: 'First Action',
                  backgroundColor: Colors.green,
                  onPressed: () {},
                  child: const Icon(Icons.chat)),
            ),
            Positioned(
              bottom: 70.0,
              right: 4.0,
              child: FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Colors.lightBlue,
                  )),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refreshChatList,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: const Icon(
                            Icons.circle_outlined,
                            color: Colors.lightBlue,
                          ),
                        ),

                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Ask Meta AI or Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(cardData[index]["image"]!),
                          radius: 25,
                        ),
                        title: Text(
                          cardData[index]["title"]!,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(cardData[index]["subtitle"]!),
                        trailing: Text(cardData[index]["time"] ?? ''),
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => MyStackApp(
                          //         name: cardData[index]["title"] ?? '')));
                        });
                  }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                    );
                },
                ),
                const SizedBox(
                  height: 72,
                )
              ],
            ),
          ),
        ));
  }
}
