import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'games.dart'; // Import the games.dart file
import 'chat.dart';
import 'daily.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DailyRewardsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/SignwayLogo4.png', width: 200, height: 200,),
      ),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg5.png'),
            fit: BoxFit.cover, // This property makes the background compatible for screen sizes
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Welcome To Signway!',
                  style: TextStyle(fontFamily: 'Moderna',fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Please enter your username:',
                  style: TextStyle(fontFamily:'Montserrat',fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Adjusted spacing
              SizedBox(
               // Add top padding here
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainMenuScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFCA188),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontFamily: 'Moderna',fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MainMenuScreen

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BG_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text.rich(
                  TextSpan(
                    children: [

                      TextSpan(
                        text: 'Start Now\n',
                        style: TextStyle(fontFamily: 'Moderna', fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Your Guide to Indian Sign Language',
                        style: TextStyle(fontFamily:'Montserrat', fontSize: 24, fontWeight: FontWeight.normal),
                      ),
                    ],
                    style: TextStyle(color: Colors.black),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                'assets/girl3.png', // Replace 'girl1.png' with your image asset path
                width: 300, // Adjust the width of the image
                height: 300, // Adjust the height of the image
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF03DAC5),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Start Learning Signs',
                  style: TextStyle(fontFamily: 'Moderna', fontSize: 20,color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen2()), // Navigate to GamesScreen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFCA188),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Play Learning Games',
                  style: TextStyle(fontFamily: 'Moderna', fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeafCommunityApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF03DAC5),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Join the Community',
                  style: TextStyle(fontFamily: 'Moderna', fontSize: 20,color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFCA188),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Ask your Questions',
                  style: TextStyle(fontFamily: 'Moderna', fontSize: 20,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _selectedIndex = _pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9FCFF),
      body: PageView(
        controller: _pageController,
        children: const [
          GreetingsScreen(),
          AlphabetsScreen(),
          BasicNeedsScreen(),
          // Add more screens here as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/ic1.png',width: 75, height: 75),
            label: 'Basics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/ic2.png',width: 75, height: 75),
            label: 'Alphabets',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/ic3.png',width: 75, height: 75),
            label: 'Numbers',
          ),
          // Add more BottomNavigationBarItems here as needed
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }
}


class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFEFF),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Learn Basic Words',
              style: TextStyle(fontFamily: 'Moderna', fontSize: 35), // Adjust the font size as needed
            ),
            Image.asset(
              'assets/boy1.png', // Replace 'girl1.png' with your image asset path
              width: 200, // Adjust the width of the image
              height: 200, // Adjust the height of the image
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignVideoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Adjust padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                ),
                backgroundColor: const Color(0xFF03DAC5), // Set button color to blue (03DAC5)
              ),
              child: const Text(
                'Start',
                style: TextStyle(
                  fontFamily: 'Moderna',
                  fontSize: 20, // Adjust text size as needed
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AlphabetsScreen extends StatelessWidget {
  const AlphabetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFEFF),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Learn Alphabets',
              style: TextStyle(fontFamily: 'Moderna', fontSize: 35),
            ),
            Image.asset(
              'assets/girl1.png', // Replace 'girl1.png' with your image asset path
              width: 200, // Adjust the width of the image
              height: 200, // Adjust the height of the image
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignVideoScreen2()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Adjust padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                ),
                backgroundColor: const Color(0xFF03DAC5), // Set button color to blue (03DAC5)
              ),
              child: const Text(
                'Start',
                style: TextStyle( fontFamily: 'Moderna',
                  fontSize: 20, // Adjust text size as needed
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicNeedsScreen extends StatelessWidget {
  const BasicNeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFEFF),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Learn Numbers',
              style: TextStyle(fontFamily: 'Moderna', fontSize: 35),
            ),
            Image.asset(
              'assets/boy2.png', // Replace 'girl1.png' with your image asset path
              width: 200, // Adjust the width of the image
              height: 200, // Adjust the height of the image
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignVideoScreen3()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Adjust padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                ),
                backgroundColor: const Color(0xFF03DAC5), // Set button color to blue (03DAC5)
              ),
              child: const Text(
                'Start',
                style: TextStyle(fontFamily: 'Moderna',
                  fontSize: 20, // Adjust text size as needed
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//BASIC WORDS
class SignVideoScreen extends StatefulWidget {
  const SignVideoScreen({super.key});

  @override
  _SignVideoScreenState createState() => _SignVideoScreenState();
}

class _SignVideoScreenState extends State<SignVideoScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Sign Language'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          } else {
            // Swiping left
            if (_currentPage < 4) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildSignLanguageScreen('Challenges', 'sign_hello.gif', 'Hello', progressValue: 0.08),
                  _buildSignLanguageScreen('Challenges', 'sign_india.gif', 'India / Indian', progressValue: 0.15),
                  _buildSignLanguageScreen('Challenges', 'sign_deaf.gif', 'Deaf', progressValue: 0.23),
                  _buildSignLanguageScreen('Challenges', 'sign_help.gif', 'Help', progressValue: 0.31),
                  _buildSignLanguageScreen('Challenges', 'sign_woman.gif', 'Woman', progressValue: 0.38),
                  _buildSignLanguageScreen('Challenges', 'sign_man.gif', 'Man', progressValue: 0.46),
                  _buildSignLanguageScreen('Challenges', 'sign_me.gif', 'I / me', progressValue: 0.54),
                  _buildSignLanguageScreen('Challenges', 'sign_you.gif', 'You', progressValue: 0.62),
                  _buildSignLanguageScreen('Challenges', 'sign_she.gif', 'She', progressValue: 0.69),
                  _buildSignLanguageScreen('Challenges', 'sign_he.gif', 'He', progressValue: 0.77),
                  _buildSignLanguageScreen('Challenges', 'sign_thankyou.gif', 'Thank You', progressValue: 0.85),
                  _buildSignLanguageScreen('Challenges', 'sign_welcome.gif', 'Welcome', progressValue: 0.92),
                  _buildSignLanguageScreen('Challenges', 'sign_bye.gif', 'Goodbye', progressValue: 1.0),






                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_currentPage < 12) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignLanguageScreen(
      String title,
      String gifAsset,
      String word, {
        double? progressValue,
        Color? progressColor, // Optional: Customize progress bar color
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/$gifAsset',
              width: 300, // Adjust width as needed
              height: 500, // Adjust height as needed
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        progressValue != null
            ? LinearProgressIndicator(
          value: progressValue,
          color: progressColor ?? Colors.blue, // Use provided color or default blue
        )
            : Container(), // Display LinearProgressIndicator only if progressValue is provided
        const SizedBox(height: 20),
        Text(
          word,
          style: const TextStyle(fontFamily:'Montserrat', fontSize: 30),
        ),
      ],
    );
  }
}
//ALPHABETS
class SignVideoScreen2 extends StatefulWidget {
  const SignVideoScreen2({super.key});

  @override
  _SignVideoScreenState2 createState() => _SignVideoScreenState2();
}

class _SignVideoScreenState2 extends State<SignVideoScreen2> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language Video'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          } else {
            // Swiping left
            if (_currentPage < 4) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                  children: [
                    _buildSignLanguageScreen('Greetings', 'sign_a.gif', 'A', progressValue: 1 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-b.gif', 'B', progressValue: 2 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-c.gif', 'C', progressValue: 3 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-d.gif', 'D', progressValue: 4 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-e.gif', 'E', progressValue: 5 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-f.gif', 'F', progressValue: 6 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-g.gif', 'G', progressValue: 7 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-h.gif', 'H', progressValue: 8 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-i.gif', 'I', progressValue: 9 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-j.gif', 'J', progressValue: 10 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-k.gif', 'K', progressValue: 11 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-l.gif', 'L', progressValue: 12 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-m.gif', 'M', progressValue: 13 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-n.gif', 'N', progressValue: 14 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-o.gif', 'O', progressValue: 15 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-p.gif', 'P', progressValue: 16 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-q.gif', 'Q', progressValue: 17 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-r.gif', 'R', progressValue: 18 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-s.gif', 'S', progressValue: 19 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-t.gif', 'T', progressValue: 20 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-u.gif', 'U', progressValue: 21 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-v.gif', 'V', progressValue: 22 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-w.gif', 'W', progressValue: 23 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-x.gif', 'X', progressValue: 24 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-y.gif', 'Y', progressValue: 25 / 26),
                    _buildSignLanguageScreen('Challenges', 'sign-z.gif', 'Z', progressValue: 1.0),

                  ]

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_currentPage < 25) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignLanguageScreen(
      String title,
      String gifAsset,
      String word, {
        double? progressValue,
        Color? progressColor, // Optional: Customize progress bar color
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Same radius as above
            child: Image.asset(
              'assets/$gifAsset',
              width: 300, // Adjust width as needed
              height: 500, // Adjust height as needed
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        progressValue != null
            ? LinearProgressIndicator(
          value: progressValue,
          color: progressColor ?? Colors.blue, // Use provided color or default blue
        )
            : Container(),
        const SizedBox(height: 20),
        Text(
          word,
          style: const TextStyle(fontFamily:'Montserrat', fontSize: 30),
        ),
      ],
    );
  }
}
//NUMBERS
class SignVideoScreen3 extends StatefulWidget {
  const SignVideoScreen3({super.key});

  @override
  _SignVideoScreenState3 createState() => _SignVideoScreenState3();
}

class _SignVideoScreenState3 extends State<SignVideoScreen3> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language Video'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          } else {
            // Swiping left
            if (_currentPage < 11) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildSignLanguageScreen('Challenges', 'sign_1.gif', '1', progressValue: 0.1),
                    _buildSignLanguageScreen('Challenges', 'sign_2.gif', '2', progressValue: 0.2),
                    _buildSignLanguageScreen('Challenges', 'sign_3.gif', '3', progressValue: 0.3),
                    _buildSignLanguageScreen('Challenges', 'sign_4.gif', '4', progressValue: 0.4),
                    _buildSignLanguageScreen('Challenges', 'sign_5.gif', '5', progressValue: 0.5),
                    _buildSignLanguageScreen('Challenges', 'sign_6.gif', '6', progressValue: 0.6),
                    _buildSignLanguageScreen('Challenges', 'sign_7.gif', '7', progressValue: 0.7),
                    _buildSignLanguageScreen('Challenges', 'sign_8.gif', '8', progressValue: 0.8),
                    _buildSignLanguageScreen('Challenges', 'sign_9.gif', '9', progressValue: 0.9),
                    _buildSignLanguageScreen('Challenges', 'sign_10.gif', '10', progressValue: 1.0),


                  ]

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_currentPage < 9) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSignLanguageScreen(
      String title,
      String gifAsset,
      String word, {
        double? progressValue,
        Color? progressColor, // Optional: Customize progress bar color
      }) {
    {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  15.0), // Adjust the radius as needed
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Same radius as above
              child: Image.asset(
                'assets/$gifAsset',
                width: 300, // Adjust width as needed
                height: 500, // Adjust height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          progressValue != null
              ? LinearProgressIndicator(
            value: progressValue,
            color: progressColor ??
                Colors.blue, // Use provided color or default blue
          )
              : Container(),
          const SizedBox(height: 20),
          Text(
            word,
            style: const TextStyle(fontFamily:'Montserrat', fontSize: 30),
          ),
        ],
      );
    }
  }
}


//CHALLENGES
class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  final Map<String, String> correctAnswers = {
    'sign_hello': 'Hello',

    'sign_deaf': 'Deaf',
    // Add more correct answers here
  };

  final List<String> gifAssets = [
    'sign_hello.gif',

    'sign_deaf.gif',
    // Add more GIF asset names here
  ];

  String currentGifAsset = '';
  String userInput = '';
  Random random = Random();

  @override
  void initState() {
    super.initState();
    // Display a random GIF asset when the screen initializes
    showRandomGif();
  }

  void showRandomGif() {
    // Select a random GIF asset from the list
    int randomIndex = random.nextInt(gifAssets.length);
    setState(() {
      currentGifAsset = gifAssets[randomIndex];
    });
  }

  void checkAnswer() {
    // Get the correct answer corresponding to the currently displayed GIF
    String correctAnswer = correctAnswers[currentGifAsset.replaceAll(
        '.gif', '')] ?? '';

    // Validate the user's input against the correct answer
    bool isCorrect = userInput.toLowerCase() == correctAnswer.toLowerCase();

    // Provide feedback to the user based on their answer
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(isCorrect ? 'Correct!' : 'Incorrect!'),
            content: Text(isCorrect ? 'Well done!' : 'Try again!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  if (isCorrect) {
                    // Show another random GIF if the answer is correct
                    showRandomGif();
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language Quiz'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/$currentGifAsset',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  userInput = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Type your answer...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkAnswer,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: const Color(0xFF03DAC5),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle( fontFamily: 'Moderna',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20), // Add additional padding if needed
            ],
          ),
        ),
      ),
    );
  }
}

class DeafCommunityApp extends StatelessWidget {
  const DeafCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deaf Community App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(
      username: 'ASL_Adventurer',
      content: 'Hello, everyone! I`m looking for a quick gig in data entry. Does anyone have any contacts?',
      imageUrl: '',
      likes: 4,
      shares: 6,
      timestamp: DateTime.now(),
    ),
    Post(
      username: 'sillyBilly',
      content: 'Just finished another Hitman mission, feeling good! #GamingSunday',
      imageUrl: 'assets/image1.jpg',
      likes: 11,
      shares: 2,
      timestamp: DateTime.now(),
    ),
    Post(
      username: 'Belhyto',
      content: 'How do you like my new digital painting? :D',
      imageUrl: 'assets/image3.jpeg',
      likes: 15,
      shares: 4,
      timestamp: DateTime.now(),
    ),
    Post(
      username: 'TechTeamAnnie',
      content: 'Hello Signway community! We are a budding pharmatech start-up based in Mumbai, focusing on healthcare research. We are #LookingToHire! Email us at apply@medisync.in',
      imageUrl: '',
      likes: 21,
      shares: 9,
      timestamp: DateTime.now(),
    ),
    Post(
      username: 'frunrun',
      content: 'i am planning to go to the k-town festival, does anyone know if there will be interpreters there?',
      imageUrl:'assets/image2.jpeg',
      comments: [
        Comment(username: 'Belhyto', text: 'Yesss there are interpreters at the festival, I booked my tickets as soon as I found out :P'),
      ],
      likes: 7,
      shares: 1,
      timestamp: DateTime.now(),
    ),
    // Add more initial posts if needed
  ];

  @override
  Widget build(BuildContext context) {
    // Sort posts by time (latest first)
    posts.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deaf Community'),
      ),
      body: CommunityPosts(
        posts: posts,
        onPostAdded: (newPost) {
          setState(() {
            posts.add(newPost);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage(
              onPostAdded: (newPost) {
                setState(() {
                  posts.add(newPost);
                });
              },
            )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CommunityPosts extends StatelessWidget {
  final List<Post> posts;
  final Function(Post) onPostAdded;

  const CommunityPosts({super.key, required this.posts, required this.onPostAdded});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(post: posts[index]);
      },
    );
  }
}

class Post {
  final String username;
  final String content;
  final String imageUrl;
  final DateTime timestamp;
  List<Comment> comments;
  int likes;
  int shares;

  Post({
    required this.username,
    required this.content,
    required this.imageUrl,
    required this.timestamp,
    this.comments = const [],
    this.likes = 0,
    this.shares = 0,
  });
}

class Comment {
  final String username;
  final String text;

  Comment({required this.username, required this.text});
}

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isLiked = false;
  bool isShared = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.post.username),
            subtitle: Text(widget.post.content),
          ),
          if (widget.post.imageUrl.isNotEmpty)
            Image.asset(widget.post.imageUrl),
          Column(
            children: widget.post.comments.map((comment) {
              return Container(
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(comment.username),
                  subtitle: Text(comment.text),
                ),
              );
            }).toList(),
          ),
          CommentInputField(post: widget.post),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: isLiked ? Colors.red : Colors.black),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) {
                          widget.post.likes++;
                        } else {
                          widget.post.likes--;
                        }
                      });
                    },
                  ),
                  Text('${widget.post.likes}'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.repeat, color: isShared ? Colors.blue : Colors.black),
                    onPressed: () {
                      setState(() {
                        isShared = !isShared;
                        if (isShared) {
                          widget.post.shares++;
                        } else {
                          widget.post.shares--;
                        }
                      });
                    },
                  ),
                  Text('${widget.post.shares}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentInputField extends StatefulWidget {
  final Post post;

  const CommentInputField({super.key, required this.post});

  @override
  _CommentInputFieldState createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: _commentController,
        decoration: const InputDecoration(
          hintText: 'Add a comment...',
        ),
        onSubmitted: (commentText) {
          setState(() {
            widget.post.comments.add(
              Comment(username: 'YourUsername', text: commentText),
            );
            _commentController.clear();
          });
        },
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  final Function(Post) onPostAdded;

  PostPage({super.key, required this.onPostAdded});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontFamily:'Montserrat', fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              style: const TextStyle(fontFamily:'Montserrat', fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL (optional)',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontFamily:'Montserrat', fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Post newPost = Post(
                    username: _usernameController.text,
                    content: _bodyController.text,
                    imageUrl: _imageUrlController.text,
                    timestamp: DateTime.now(),
                    likes: 0,
                    shares: 0,
                  );
                  onPostAdded(newPost);
                  _usernameController.clear();
                  _bodyController.clear();
                  _imageUrlController.clear();
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    'Post',
                    style: TextStyle(fontFamily:'Montserrat', fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

