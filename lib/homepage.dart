import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hack Boyz'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Home')),
          TextButton(onPressed: () {}, child: const Text('Training')),
          TextButton(onPressed: () {}, child: const Text('Handover')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ContentSection(
              title: 'Welcome to Acme AI',
              content:
                  'The world\'s most powerful AI platform for your business needs.',
              buttons: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Personalized Training'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Handover Summary'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
            ContentSection(
              title: 'AI for Every Business Need',
              content:
                  'Acme AI offers a wide range of features and capabilities designed to help you harness the power of AI for your business. Whether you’re looking to improve customer service, automate routine tasks, or create custom AI models, Acme AI has everything you need to succeed.',
              buttons: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Explore Features'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Colors.grey.shade200,
      child: Image.asset(
        'images/homepagehb.jpg',
        width: MediaQuery.of(context).size.width * 0.8, // Make the image width 80% of the screen width
        height: MediaQuery.of(context).size.height * 0.4, // Adjust the height to 40% of the screen height
        fit: BoxFit.contain, // Adjust the BoxFit to contain for better aspect ratio
      ),
    );
  }
}


class ContentSection extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> buttons;

  const ContentSection({super.key, required this.title, required this.content, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: buttons,
          ),
        ],
      ),
    );
  }
}
