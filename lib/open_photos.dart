import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'full_screen_image_viewer.dart';


class OpenPhotos extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<OpenPhotos> {
  List<XFile>? _selectedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        // _selectedImages = pickedImages;
        _selectedImages?.addAll(pickedImages);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages?.removeAt(index); // Remove the image from the list
    });
  }

  void _openFullImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageViewer(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker and Viewer'),
      ),
      body: Column(
        children: [
          // Button to open gallery
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _pickImages,
              child: Text('Open Camera (Gallery)'),
            ),
          ),
          // Display images in a ListView
          Expanded(
            child: _selectedImages != null && _selectedImages!.isNotEmpty?GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
                    itemCount: _selectedImages!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _openFullImage(
                            context, _selectedImages![index].path),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.file(
                                  File(_selectedImages![index].path),
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    right: 0,
                                    child: IconButton(onPressed: () => _removeImage(index),icon: Icon(Icons.cancel),color: Colors.red,),)
                              ],

                            )
                          ],
                          // title: Text('Image ${index + 1}'),
                        ),
                      );
                    },
                  ) : Center(child: Text('No images selected')),
          ),
        ],
      ),
    );
  }
}
