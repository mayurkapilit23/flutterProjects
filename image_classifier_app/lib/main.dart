import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

void main() {
  runApp(const ImageMLApp());
}

class ImageMLApp extends StatelessWidget {
  const ImageMLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageLabelerPage(),
    );
  }
}

class ImageLabelerPage extends StatefulWidget {
  const ImageLabelerPage({super.key});

  @override
  State<ImageLabelerPage> createState() => _ImageLabelerPageState();
}

class _ImageLabelerPageState extends State<ImageLabelerPage> {
  File? _imageFile;
  List<ImageLabel> _labels = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      File imageFile = File(picked.path);
      setState(() => _imageFile = imageFile);

      final inputImage = InputImage.fromFile(imageFile);
      final labeler = ImageLabeler(
        options: ImageLabelerOptions(confidenceThreshold: 0.5),
      );
      final labels = await labeler.processImage(inputImage);

      setState(() => _labels = labels);
    }
  }


    Future<void> _pickImageFromGallary() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      File imageFile = File(picked.path);
      setState(() => _imageFile = imageFile);

      final inputImage = InputImage.fromFile(imageFile);
      final labeler = ImageLabeler(
        options: ImageLabelerOptions(confidenceThreshold: 0.5),
      );
      final labels = await labeler.processImage(inputImage);

      setState(() => _labels = labels);
    }

      HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image ML Classifier"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _imageFile != null
                ? Image.file(_imageFile!, height: 250)
                : const Text("No image selected"),
            const SizedBox(height: 20),
            const Text(
              "Detected Labels:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._labels.map(
              (label) => ListTile(
                title: Text(label.label),
                subtitle: Text(
                  "Confidence: ${(label.confidence * 100).toStringAsFixed(2)}%",
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
    
              IconButton(
                onPressed: _pickImage,
                icon: Row(children: [Icon(Icons.camera), Text("Open Camera")]),
              ),
               IconButton(
                onPressed: _pickImageFromGallary,
                icon: Row(children: [Icon(Icons.image_search), Text("Open Galary")]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
