import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/student_rounds_page.dart';  // Import the student rounds page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placement Management Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LandingPage(),
      routes: {
        '/studentRounds': (context) => const StudentRoundsPage(),  // Route to student rounds page
      },
    );
  }
}
