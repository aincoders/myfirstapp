import 'package:flutter/material.dart';

// Flutter code sample for [RadioListTile].

// void main() => runApp(const RadioListTileApp());
//
// class RadioListTileApp extends StatelessWidget {
//   const RadioListTileApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const RadioListTileExample(),
//     );
//   }
// }

enum Groceries { pickles, tomato, lettuce }

class MyRadioListTileExample extends StatefulWidget {
  const MyRadioListTileExample({super.key});

  @override
  State<MyRadioListTileExample> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<MyRadioListTileExample> {
  Groceries? _groceryItem = Groceries.tomato;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RadioListTile Sample')),
      body: Column(
        children: <Widget>[
          RadioListTile<Groceries>(
            value: Groceries.pickles,
            groupValue: _groceryItem,
            activeColor: Colors.red,
            hoverColor: Colors.cyanAccent,
            selectedTileColor: Colors.limeAccent,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Pickles'),
            subtitle: const Text('Supporting text'),
          ),
          RadioListTile<Groceries>(
            value: Groceries.tomato,
            groupValue: _groceryItem,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Tomato'),
            subtitle: const Text(
                'Longer'),
          ),
          RadioListTile<Groceries>(
            value: Groceries.lettuce,
            groupValue: _groceryItem,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Lettuce'),
            subtitle: const Text(
                "text"),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
