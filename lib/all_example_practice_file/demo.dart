import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MyDemo extends StatefulWidget {
  const MyDemo({super.key});

  @override
  State<MyDemo> createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DottedBorder(
          color: Colors.grey, // Color of the dotted border
          strokeWidth: 2, // Thickness of the dotted border
          dashPattern: [6, 3], // Dots and gaps pattern (6px dash, 3px space)
          borderType: BorderType.RRect, // Rounded rectangle border type
          radius: Radius.circular(12), // Rounded corner radius
          child: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'OEM',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('This is a card with a dotted border'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
