import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
      ),
      body: Center(
        child: const Text("Welcome to Student Dashboard!"),
      ),
    );
  }
}
