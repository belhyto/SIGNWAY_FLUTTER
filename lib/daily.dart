import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DailyRewardsScreen(),));
}

class DailyRewardsScreen extends StatefulWidget {
  const DailyRewardsScreen({Key? key}) : super(key: key);

  @override
  _DailyRewardsScreenState createState() => _DailyRewardsScreenState();
}

class _DailyRewardsScreenState extends State<DailyRewardsScreen> {
  late SharedPreferences _prefs;
  late int _lastVisitDay;
  int _points = 1;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _lastVisitDay = _prefs.getInt('last_visit_day') ?? DateTime.now().day;
    _updatePoints();
  }

  Future<void> _updatePoints() async {
    final today = DateTime.now().day;
    if (today != _lastVisitDay) {
      // It's a new day, award points
      setState(() {
        _points += 1;
      });
      // Save the current day as the last visit day
      await _prefs.setInt('last_visit_day', today);
      // Update the last visit day
      _lastVisitDay = today;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Way to go!',
              style: TextStyle(fontFamily: 'Moderna', fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'You earned another point!',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
            ),
            Image.asset('assets/trophy.png'), // Add your image here
            SizedBox(height: 20),
            Text(
              'You have $_points points now',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigate back to the GreetingScreen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const GreetingScreen()),
                );
              },
              child: Image.asset('assets/close.png', width: 50, height: 50), // Replace with close.png
            ),
          ],
        ),
      ),
    );
  }}
