import 'package:flutter/material.dart';

class AssessmentPage extends StatelessWidget {
  const AssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal trainer'),
      ),
      body: Row(
        children: [
          _buildSideMenu(),
          
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return Container(
      width: 200,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuItem(Icons.assessment, 'Technical assessments', isSelected: true),
          _buildMenuItem(Icons.computer, 'Laravel training'),
          _buildMenuItem(Icons.php, 'PHP training'),
          _buildMenuItem(Icons.html, 'HTML Training'),
          _buildMenuItem(Icons.css, 'CSS Training'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isSelected = false}) {
    return Container(
      color: isSelected ? Colors.white : Colors.grey.shade200,
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black),
        title: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.black),
        ),
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }



}
