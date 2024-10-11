import 'package:flutter/material.dart';

class MyCommunitiesPage extends StatelessWidget {
  const MyCommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.asset("assets/images/whatsapp_communities.png",  width: 300,),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Stay Connected with a community',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                "Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you're added to will appear here.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("See example communities",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Start your community"),
              ),
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
