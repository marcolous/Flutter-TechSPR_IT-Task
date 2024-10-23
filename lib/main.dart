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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int? years;
  int? months;
  int? days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Age Counter 👵👴')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => _pickDate(context),
              child: const Text('Pick a Date'),
            ),
          ),
          const SizedBox(height: 50),
          if (years != null || months != null || days != null)
            CustomText(
              title: 'You have $years years - $months months - $days days 😼',
            )
          else
            const CustomText(title: 'Pick a date First 🤨')
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final now = DateTime.now();
      final age = now.difference(pickedDate);
      setState(() {
        years = age.inDays ~/ 365;
        months = (age.inDays % 365) ~/ 30;
        days = (age.inDays % 365) % 30;
      });
    }
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);
    return Text(
      title,
      style: style,
      maxLines: 4,
      textAlign: TextAlign.center,
    );
  }
}
