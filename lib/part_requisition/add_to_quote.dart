import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddToQuote extends StatefulWidget {
  const AddToQuote({super.key});

  @override
  State<AddToQuote> createState() => _AddToQuoteState();
}

class _AddToQuoteState extends State<AddToQuote> {
  final List<XFile?> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImages.add(image);
      });
      // _openImagePainter(image);
    }
  }

  // Future<void> _openImagePainter(XFile image) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => ImagePainterScreen(imageFile: imageFile),
  //   ));
  // }

  Future<void> _openGallery() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages.addAll(images);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index); // Remove the image from the list
    });
  }

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  void _clearAllFields() {
    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
    _controller6.clear();
  }

  // @override
  // void dispose() {
  //   _controller1.dispose();55
  //   _controller2.dispose();
  //   _controller3.dispose();
  //   _controller4.dispose();
  //   _controller5.dispose();
  //   _controller6.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Quote"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Air Filter",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Req. QTY",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "161236902",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      "10 UNT",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                //P1 main
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    Card(
                      elevation: 3, //P2 A
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Third Party",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                    InkWell(
                                      onTap: _clearAllFields,
                                      child: Text("Remove",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  color: Colors.red,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.red)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller1,
                                        decoration: InputDecoration(
                                          labelText: 'Rate *',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller2,
                                        decoration: InputDecoration(
                                          labelText: 'Quantity *',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller3,
                                        decoration: InputDecoration(
                                          labelText: 'Warranty Number',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller4,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          labelText: 'Days',
                                          suffixIcon: const Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _controller5,
                                  decoration: InputDecoration(
                                    labelText: 'Delivery Date',
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.orange, width: 2.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _controller6,
                                  decoration: InputDecoration(
                                    labelText: 'Notes',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.orange, width: 2.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 1,
                              dashPattern: const [6, 4],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text("Attachments",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontWeight: FontWeight
                                                              .w500))),
                                          InkWell(
                                            onTap: _openCamera,
                                            child: const Icon(
                                              Icons.description_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.mic_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            width: 1,
                                            height: 24,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.video_library_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: _openCamera,
                                            child: const Icon(
                                              Icons.video_call_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            width: 1,
                                            height: 24,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: _openGallery,
                                            child: const Icon(
                                              Icons.collections_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: _openCamera,
                                            child: const Icon(
                                              Icons.photo_camera_outlined,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      _selectedImages.isNotEmpty
                                          ? GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 16,
                                                      mainAxisSpacing: 12),
                                              itemCount: _selectedImages.length,
                                              itemBuilder: (context, index) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          width:
                                                              1, // Thinner border
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .outline, // Changed border color for visibility
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.file(
                                                          File(_selectedImages[
                                                                  index]!
                                                              .path),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        right: 8,
                                                        top: 8,
                                                        child: GestureDetector(
                                                            onTap: () =>
                                                                _removeImage(
                                                                    index),
                                                            child: const Icon(
                                                                Icons.cancel)))
                                                  ],
                                                );
                                              },
                                            )
                                          : SizedBox(
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Photo, Videos, And Documents',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                    child: Text(
                                                        'You Can Upload up to 10 files of the following types: Image, Video, Audio, PDF Excel, and Docx. Each file must be 5MB or less',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                  ),
                                                  const SizedBox(height: 24),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("OEM",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                    InkWell(
                                      onTap: _clearAllFields,
                                      child: Text("Remove",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  color: Colors.red,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.red)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller1,
                                        decoration: InputDecoration(
                                          labelText: 'Rate *',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller2,
                                        decoration: InputDecoration(
                                          labelText: 'Quantity *',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller3,
                                        decoration: InputDecoration(
                                          labelText: 'Warranty Number',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _controller4,
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          labelText: 'Days',
                                          suffixIcon: const Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _controller5,
                                  decoration: InputDecoration(
                                    labelText: 'Delivery Date',
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.orange, width: 2.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _controller6,
                                  decoration: InputDecoration(
                                    labelText: 'Notes',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.orange, width: 2.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 1,
                              dashPattern: const [6, 4],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text("Attachments",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontWeight: FontWeight
                                                              .w500))),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.description_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.mic_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            width: 1,
                                            height: 24,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.video_library_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.video_call_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            width: 1,
                                            height: 24,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.collections_outlined,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.photo_camera_outlined,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      // _selectedImages.isNotEmpty
                                      //     ? GridView.builder(
                                      //         physics:
                                      //             const NeverScrollableScrollPhysics(),
                                      //         shrinkWrap: true,
                                      //         gridDelegate:
                                      //             const SliverGridDelegateWithFixedCrossAxisCount(
                                      //                 crossAxisCount: 3,
                                      //                 crossAxisSpacing: 16,
                                      //                 mainAxisSpacing: 12),
                                      //         itemCount: _selectedImages.length,
                                      //         itemBuilder: (context, index) {
                                      //           return Stack(
                                      //             children: [
                                      //               Container(
                                      //                 width: double.infinity,
                                      //                 decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(16.0),
                                      //                   border: Border.all(
                                      //                     width:
                                      //                         1, // Thinner border
                                      //                     color: Theme.of(
                                      //                             context)
                                      //                         .colorScheme
                                      //                         .outline, // Changed border color for visibility
                                      //                   ),
                                      //                 ),
                                      //                 // child: ClipRRect(
                                      //                 //   borderRadius:
                                      //                 //       BorderRadius
                                      //                 //           .circular(16.0),
                                      //                 //   child: Image.file(
                                      //                 //     File(){},
                                      //                 //     fit: BoxFit.fill,
                                      //                 //   ),
                                      //                 // ),
                                      //               ),
                                      //               Positioned(
                                      //                   right: 8,
                                      //                   top: 8,
                                      //                   child: GestureDetector(
                                      //                       onTap: () {},
                                      //                       child: const Icon(
                                      //                           Icons.cancel)))
                                      //             ],
                                      //           );
                                      //         },
                                      //       )
                                      //     :
                                      SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Photo, Videos, And Documents',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                      vertical: 12),
                                              child: Text(
                                                  'You Can Upload up to 10 files of the following types: Image, Video, Audio, PDF Excel, and Docx. Each file must be 5MB or less',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall),
                                            ),
                                            const SizedBox(height: 24),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      margin: const EdgeInsets.only(top: 32),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            padding: const EdgeInsets.symmetric(vertical: 12)),
                        child: const Text("Submit"),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
