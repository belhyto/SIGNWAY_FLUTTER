/*
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:path_provider/path_provider.dart';




class HandGestureRecognizer extends StatefulWidget {
  @override
  _HandGestureRecognizerState createState() => _HandGestureRecognizerState();
}

class _HandGestureRecognizerState extends State<HandGestureRecognizer> {
  late CameraController _controller;
  bool _isModelLoaded = false;
  String _recognizedGesture = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadTFLiteModel();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    _controller = CameraController(frontCamera, ResolutionPreset.high);
    await _controller.initialize();
  }

  Future<void> _loadTFLiteModel() async {
    final modelPath = await _getModelPath();
    await Tflite.loadModel(
      model: modelPath,
      numThreads: 1,
      isAsset: false,
    );
    setState(() {
      _isModelLoaded = true;
    });
  }

  Future<String> _getModelPath() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final modelPath = '${appDirectory.path}/keypoint_classifier.tflite';
    final file = File(modelPath);
    if (await file.exists()) {
      return modelPath;
    } else {
      // Copy the model from your assets folder to the app directory
      final modelData = await rootBundle.load('assets/keypoint_classifier.tflite');
      await file.writeAsBytes(modelData.buffer.asUint8List());
      return modelPath;
    }
  }

  Future<void> _recognizeGesture() async {
    if (_controller.value.isInitialized && _isModelLoaded) {
      final image = await _controller.takePicture();
      final recognizedGesture = await Tflite.runModelOnBinary(
        binary: File(image.path).readAsBytesSync(),
      );
      setState(() {
        _recognizedGesture = recognizedGesture.first;
      });
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hand Gesture Recognition'),
      ),
      body: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          )
              : Container(),
          ElevatedButton(
            onPressed: _isModelLoaded ? _recognizeGesture : null,
            child: Text('Recognize Gesture'),
          ),
          Text(_recognizedGesture),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
*/
