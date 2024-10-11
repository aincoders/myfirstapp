import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add image picker
import 'dart:io'; // For using File

class OpenCamera extends StatelessWidget {
  const OpenCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCameraPage(),
    );
  }
}

class MyCameraPage extends StatefulWidget {
  const MyCameraPage({super.key});

  @override
  _MyCameraPageState createState() => _MyCameraPageState();
}

class _MyCameraPageState extends State<MyCameraPage> {
  File? _image; // Variable to hold the captured image

  // Function to open the camera and capture an image
  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera); // Open camera

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the captured image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null // Check if an image has been captured
                ? const Text("No image captured")
                : Image.file(
              _image!, // Display captured image
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _openCamera, // Open camera on button press
              child: const Text("Open Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
