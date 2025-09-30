// import 'package:flutter/material.dart';
// import 'package:textscan_app/screens/bottomNavigation.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BottomNavExample(),
//     );
//   }
// }

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const TextScannerApp());
}

class TextScannerApp extends StatelessWidget {
  const TextScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Scanner',
      home: const CameraScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool isInitialized = false;
  String scannedText = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _controller = CameraController(cameras[0], ResolutionPreset.max);
      await _controller.initialize();
      setState(() {
        isInitialized = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _scanTextFromImage() async {
    try {
      final dir = await getTemporaryDirectory();
      final filePath = join(dir.path, '${DateTime.now()}.png');

      await _controller.takePicture().then((XFile file) async {
        File imageFile = File(file.path);

        final inputImage = InputImage.fromFile(imageFile);
        final textRecognizer = TextRecognizer(
          script: TextRecognitionScript.latin,
        );
        final RecognizedText result = await textRecognizer.processImage(
          inputImage,
        );

        setState(() {
          scannedText = result.text;
        });
      });
    } catch (e) {
      print('Error scanning text: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Scanner')),
      body: Column(
        children: [
          isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _scanTextFromImage,
            child: const Text('Scan Text'),
          ),
          const SizedBox(height: 10),
          scannedText.isEmpty
              ? Text('No data', style: TextStyle(color: Colors.red))
              : Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          scannedText,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
