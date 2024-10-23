import 'package:flutter/material.dart';

void main() {
  runApp(const TechSPRIT());
}

class TechSPRIT extends StatelessWidget {
  const TechSPRIT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Age Counter 👵👴')),
      body: const Column(
        children: [],
      ),
    );
  }
}
