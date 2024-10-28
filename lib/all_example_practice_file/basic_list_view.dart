import 'package:flutter/material.dart';

class MyBasicListViewPage extends StatelessWidget {
  final List<String> items = List.generate(1000, (index) => 'Item $index');

  MyBasicListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.star),
            title: Text(items[index]),
            subtitle: Text('Subtitle for ${items[index]}'),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
