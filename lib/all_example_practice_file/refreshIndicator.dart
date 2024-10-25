import 'package:flutter/material.dart';

class MyRefreshIndicatorPage extends StatefulWidget {
  const MyRefreshIndicatorPage({super.key});

  @override
  _MyChatsPageState createState() => _MyChatsPageState();
}

class _MyChatsPageState extends State<MyRefreshIndicatorPage> {
  final List<Map<String, String>> _cardData = [
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
    }, {
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
    // Add more items as needed...
  ];

  Future<void> _refreshChatList() async {
    // Simulate a network request or data fetching process
    await Future.delayed(const Duration(seconds: 2));

    // For demonstration, shuffle the list or update it with new data
    setState(() {
      _cardData.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat_sharp),
      ),
      body: RefreshIndicator(

        onRefresh: _refreshChatList,
        color: Colors.blue,
        backgroundColor: Colors.white,
        displacement: 40.0,
        strokeWidth: 3.0,
        edgeOffset: 10.0,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Search Bar Container
              Container(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.grey.shade200,
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
                            contentPadding: EdgeInsets.all(0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Chat List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cardData.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(_cardData[index]["image"]!),
                        radius: 25,
                      ),
                      title: Text(
                        _cardData[index]["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_cardData[index]["subtitle"]!),
                      trailing: Text(_cardData[index]["time"]!),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
