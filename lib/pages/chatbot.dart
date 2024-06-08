import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  bool _isExpanded = false;
  bool _showWelcomeMessage = false;
  final List<Map<String, String>> _chatMessages = [];
  final List<Map<String, String>> _displayMessages = [];
  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showWelcomeMessage = true;
      });
    });
  }

  void _toggleChatBot() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _showWelcomeMessage = true;
          });
        });
      } else {
        _showWelcomeMessage = false;
        _chatMessages.clear();
        _displayMessages.clear();
        _currentMessageIndex = 0;
      }
    });
  }

  void _handlePromptSelection(String prompt) {
    setState(() {
      _chatMessages.add({'type': 'question', 'content': prompt});
      if (prompt ==
          "Which project has created biggest venue in the past, current and possibly in future?") {
        _chatMessages.add({
          'type': 'answer',
          'content':
              "Based on the latest update 3 mins ago, PROJ001 will have the biggest revenue in the past. The biggest revenue in the current will be PROJ002 while also will be the biggest revenue in the future surpassing PROJ001"
        });
      } else if (prompt ==
          "Which employee is showing best performance for this month?") {
        _chatMessages.add({
          'type': 'answer',
          'content':
              "The best performance employee for this month goes to Mr Rajeed, for his outstanding performance in PROJ001 and PROJ002. The podium followed by Mrs Marry, from design department for her creative web design in both same project."
        });
      }
    });
    _displayNextMessage();
  }

  void _displayNextMessage() {
    if (_currentMessageIndex < _chatMessages.length) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _displayMessages.add(_chatMessages[_currentMessageIndex]);
          _currentMessageIndex++;
          _displayNextMessage();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _isExpanded ? 300 : 70,
        height: _isExpanded ? 500 : 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 35),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          image: !_isExpanded
              ? const DecorationImage(
                  image: AssetImage('images/chatbot.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _isExpanded ? _buildChatInterface() : _buildChatButton(),
      ),
    );
  }

  Widget _buildChatButton() {
    return GestureDetector(
      onTap: _toggleChatBot,
      child: Container(
        alignment: Alignment.center,
        child: const Icon(Icons.chat, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildChatInterface() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'EZ-Pro ChatBot',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              GestureDetector(
                onTap: _toggleChatBot,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_showWelcomeMessage)
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Hi, welcome to EZ-Pro chatbot. Please choose your question prompt and our AI will answer based on real-time data",
                        textStyle: const TextStyle(fontSize: 14),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                const SizedBox(height: 16),
                _buildChatPrompt(
                  "Which project has created biggest venue in the past, current and possibly in future?",
                ),
                _buildChatPrompt(
                  "Which employee is showing best performance for this month?",
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: _displayMessages.map((message) {
                      if (message['type'] == 'question') {
                        return Container(
                          padding: const EdgeInsets.all(12.0),
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message['content']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      } else {
                        return AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              message['content']!,
                              textStyle: const TextStyle(fontSize: 14),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          totalRepeatCount: 1,
                        );
                      }
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatPrompt(String prompt) {
    return GestureDetector(
      onTap: () => _handlePromptSelection(prompt),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          prompt,
          style: const TextStyle(fontSize: 12), // Smaller font size for the prompt
        ),
      ),
    );
  }
}
