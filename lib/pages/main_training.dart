import 'package:flutter/material.dart';
import 'package:hackboys_app/pages/loading.dart';
import 'package:hackboys_app/widget/navbar_widget.dart';

class MainTraining extends StatefulWidget {
  const MainTraining({super.key});

  @override
  State<MainTraining> createState() => _MainTrainingState();
}

class _MainTrainingState extends State<MainTraining> {
  final TextEditingController _nameController = TextEditingController();
  String _laravelSkillLevel = '';
  String _phpSkillLevel = '';
  String _htmlSkillLevel = '';
  String _cssSkillLevel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const NavBarWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome steve. For starter, please answer some questions below:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                
                  const SizedBox(height: 40),
                  const Text(
                    'What is your skill level in Laravel?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillLevelButton('Beginner', 'Laravel'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Intermediate', 'Laravel'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Expert', 'Laravel'),
                    ],
                  ),
                  const SizedBox(height: 40), // Add space between the two questions
                  const Text(
                    'What is your skill level in PHP?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillLevelButton('Beginner', 'PHP'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Intermediate', 'PHP'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Expert', 'PHP'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'What is your skill level in HTML?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillLevelButton('Beginner', 'HTML'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Intermediate', 'HTML'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Expert', 'HTML'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'What is your skill level in CSS?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillLevelButton('Beginner', 'CSS'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Intermediate', 'CSS'),
                      const SizedBox(width: 10),
                      _buildSkillLevelButton('Expert', 'CSS'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoadingScreen(),
                        ),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillLevelButton(String level, String type) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (type == 'Laravel') {
            _laravelSkillLevel = level;
          } else if (type == 'PHP') {
            _phpSkillLevel = level;
          } else if (type == 'HTML') {
            _htmlSkillLevel = level;
          } else if (type == 'CSS') {
            _cssSkillLevel = level;
          }
        });
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: _getTextColor(level, type),
        backgroundColor: _getBackgroundColor(level, type),
      ),
      child: Text(level),
    );
  }

  Color _getBackgroundColor(String level, String type) {
    if ((type == 'Laravel' && _laravelSkillLevel == level) ||
        (type == 'PHP' && _phpSkillLevel == level) ||
        (type == 'HTML' && _htmlSkillLevel == level) ||
        (type == 'CSS' && _cssSkillLevel == level)) {
      return Colors.blue;
    }
    return Colors.white;
  }

  Color _getTextColor(String level, String type) {
    if ((type == 'Laravel' && _laravelSkillLevel == level) ||
        (type == 'PHP' && _phpSkillLevel == level) ||
        (type == 'HTML' && _htmlSkillLevel == level) ||
        (type == 'CSS' && _cssSkillLevel == level)) {
      return Colors.white;
    }
    return Colors.black;
  }
}
