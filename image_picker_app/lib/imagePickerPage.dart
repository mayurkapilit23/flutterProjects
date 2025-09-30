import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  //to get image from gallery
  Future getImageFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  //open camera
  Future openCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                OutlinedButton(
                  onPressed: openCamera,
                  child: Text("open camera"),
                ),
                OutlinedButton(
                  onPressed: getImageFromGallery,
                  child: Text("image picker"),
                ),
              ],
            ),

            Expanded(
              child: _image == null
                  ? Image.asset('assets/no_photo.png', height: 100, width: 100)
                  : Image.file(File(_image!.path)),
            ),

            ElevatedButton(onPressed: () {}, child: Text("Convert into PDF")),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
