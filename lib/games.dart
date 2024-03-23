import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen2(),
  ));
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  _SplashScreenState2 createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<SplashScreen2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller);

    _controller.forward();

    // Navigate to GamesScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const GestureGameScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Play Now!",
              style: TextStyle(fontFamily:'Moderna', fontSize: 40),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation.value),
                  child: Image.asset(
                    'assets/bo2.png', // Replace with your game icon image path
                    width: 400, // Adjust the width as needed
                    height: 400, // Adjust the height as needed
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


//CAMERA INIT

enum DetectionClasses { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p }

class Classifier {
  late Interpreter _interpreter;

  static const String modelFile = "converted_model.tflite";

  Future<void> loadModel({Interpreter? interpreter}) async {
    try {
      _interpreter = interpreter ??
          await Interpreter.fromAsset(
            modelFile,
            options: InterpreterOptions()..threads = 4,
          );

      _interpreter.allocateTensors();
    } catch (e) {
      print("Error while creating interpreter: $e");
    }
  }

  Interpreter get interpreter => _interpreter;
}

class GestureGameScreen extends StatefulWidget {
  const GestureGameScreen({super.key});

  @override
  _GestureGameScreenState createState() => _GestureGameScreenState();
}

class _GestureGameScreenState extends State<GestureGameScreen> {
  late CameraController cameraController;
  late Classifier classifier;

  bool initialized = false;
  bool isWorking = false;

  @override
  void initState() {
    super.initState();
    initialize();
    classifier = Classifier();
  }

  Future<void> initialize() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );

    await cameraController.initialize();
    cameraController.startImageStream((CameraImage image) {
      if (!isWorking) {
        processCameraImage(image);
      }
    });

    setState(() {
      initialized = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Game'),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/girl4.png', // Replace 'girl1.png' with your image asset path
                  width: 300, // Adjust the width of the image
                  height: 300, // Adjust the height of the image
                  fit: BoxFit.contain, // Maintain aspect ratio
                ),
              ),
              SizedBox(width: 20), // Add spacing between image and text
              Padding(
                padding: const EdgeInsets.only(right: 20.0),

                child: Text(
                  'Hello, What is your name?', // Replace with your desired text
                  style: TextStyle(
                    fontSize: 15, // Adjust the font size as needed
                      fontFamily:'Montserrat', // Adjust the font weight as needed
                  ),
                ),
              ),

            ],
          ),

          if (initialized)
            Positioned.fill(
              top:200,
              // Adjust the top position to fit your layout
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 150 * 2, // Adjust the width of the camera preview (maintain aspect ratio)
                  height: 200 * 2,  // Adjust the height of the camera preview
                  child: AspectRatio(
                    aspectRatio: cameraController.value.aspectRatio,
                    child: CameraPreview(cameraController),
                  ),
              ),
            ),
            ),
            ),
          if (!initialized)
            Positioned.fill(
              top: 300, // Adjust the top position to fit your layout
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }


  Future<void> processCameraImage(CameraImage image) async {
    try {
      if (!mounted || classifier.interpreter == null) {
        return;
      }

      setState(() {
        isWorking = true;
      });

      // Implement your image processing logic using the Classifier class
      final interpreter = classifier.interpreter;

      // Perform inference on the image
      // Example:
      // interpreter.run(image.buffer, ...);

    } finally {
      setState(() {
        isWorking = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }
}


