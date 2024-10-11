import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_painter/image_painter.dart';

class ImagePainterScreen extends StatelessWidget {
  final File imageFile;

  const ImagePainterScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              // Save the edited image
              final RenderRepaintBoundary boundary =
              context.findRenderObject() as RenderRepaintBoundary;
              final image = await boundary.toImage();
              final byteData = await image.toByteData(format: ImageByteFormat.png);
              final buffer = byteData!.buffer.asUint8List();
              // Here, you can save the image buffer to file or use as needed
              Navigator.of(context).pop(); // Close the painter screen after saving
            },
          ),
        ],
      ),
      body: ImagePainter.file(
        imageFile, // Pass the captured image to the painter
        scalable: true, controller: ImagePainterController(),
      ),
    );
  }
}