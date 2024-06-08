import 'package:flutter/material.dart';
import 'package:hackboys_app/pages/technical_assesment.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int _currentStep = 0;
  final List<String> _loadingTexts = [
    'Analyzing the data...',
    'Creating personal training programme...',
    'Finalizing...'
  ];

  @override
  void initState() {
    super.initState();
    _startLoadingProcess();
  }

  void _startLoadingProcess() async {
    for (int i = 0; i < _loadingTexts.length; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          _currentStep = i;
        });
      }
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AssessmentPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _loadingTexts[_currentStep],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
