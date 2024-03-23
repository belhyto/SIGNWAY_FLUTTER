import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen3(),
  ));
}

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  _SplashScreenState3 createState() => _SplashScreenState3();
}

class _SplashScreenState3 extends State<SplashScreen3> with SingleTickerProviderStateMixin {
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
        MaterialPageRoute(builder: (_) => const ChatScreen()),
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
              "Chat Now!",
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
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.insert(0, ChatMessage(text: "Which word do you need help with?", isUser: false));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage userMessage = ChatMessage(
      text: text,
      isUser: true,
    );
    List<String> suggestedWords = generateSuggestedWords(text);
    ChatMessage botMessage = ChatMessage(
      text: "Did you mean any of these?",
      isUser: false,
      suggestedWords: suggestedWords,
    );
    setState(() {
      _messages.insert(0, userMessage);
      _messages.insert(0, botMessage);
    });
    // You can add logic here to handle the user input, like sending it to a chatbot API
  }

  List<String> generateSuggestedWords(String word) {
    // Here you can implement your logic to generate suggested words based on the input word
    // For simplicity, I'm providing some example words
    List<String> exampleWords = ['apples', 'bananas', 'oranges'];
    return exampleWords;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter your word',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Color(0xFFEF9D85), // Set the icon color to EF9D85
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }


}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final List<String>? suggestedWords;

  ChatMessage({required this.text, required this.isUser, this.suggestedWords});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (!isUser)
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text('Bot'),
                  ),
                ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: isUser ? Radius.circular(20.0) : Radius.circular(0.0),
                      topRight: isUser ? Radius.circular(0.0) : Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: isUser ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ],
          ),
          if (!isUser && suggestedWords != null)
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: suggestedWords!.map((word) {
                  return Container(
                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        print('User selected: $word');
                      },
                      child: Text(word),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}