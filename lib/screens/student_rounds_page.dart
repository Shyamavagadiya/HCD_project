import 'package:flutter/material.dart';

class StudentRoundsPage extends StatefulWidget {
  const StudentRoundsPage({super.key});

  @override
  _StudentRoundsPageState createState() => _StudentRoundsPageState();
}

class _StudentRoundsPageState extends State<StudentRoundsPage> {
  String? _selectedCompany;
  bool _isRound1Confirmed = false;
  bool _isRound2Confirmed = false;
  String _resultMessage = ''; // To display result message like "Congratulations"
  bool _isRound1Answered = false; // To check if Round 1 response is already given
  bool _isRound2Answered = false; // To check if Round 2 response is already given

  final List<String> companies = ['Company A', 'Company B', 'Company C'];
  final Map<String, List<String>> rounds = {
    'Company A': ['Round 1: Written Test', 'Round 2: Technical Interview'],
    'Company B': ['Round 1: Online Test', 'Round 2: Group Discussion'],
    'Company C': ['Round 1: Coding Challenge', 'Round 2: HR Interview'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 57, 214, 120),
                  const Color.fromARGB(255, 46, 101, 38),
                ],
              ),
            ),
          ),
          // Main content inside SafeArea
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Placement Rounds',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Select Company and Confirm Rounds',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Content for selecting company and round confirmation
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Dropdown for selecting the company
                        DropdownButton<String>(
                          value: _selectedCompany,
                          hint: const Text('Select a Company'),
                          isExpanded: true,
                          items: companies.map((String company) {
                            return DropdownMenuItem<String>(
                              value: company,
                              child: Text(company),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCompany = newValue;
                              _isRound1Confirmed = false; // Reset round confirmation
                              _isRound2Confirmed = false;
                              _isRound1Answered = false; // Reset round answer status
                              _isRound2Answered = false;
                              _resultMessage = ''; // Reset result message
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        // Show Round 1 Confirmation (Green Box)
                        if (_selectedCompany != null && !_isRound1Answered)
                          GestureDetector(
                            onTap: () => _showRoundConfirmationDialog(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Text(
                                'Have you selected in Round 1?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        // Show Round 2 Confirmation (Green Box)
                        if (_isRound1Confirmed && !_isRound2Answered)
                          GestureDetector(
                            onTap: () => _showRoundConfirmationDialog(2),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Text(
                                'Have you selected in Round 2?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        // Display the congratulatory message if applicable
                        if (_resultMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              _resultMessage,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Version info at the bottom
          Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              'v1.0.0',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to show the round confirmation dialog
  void _showRoundConfirmationDialog(int roundNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Round $roundNumber'),
          content: Text('Have you completed Round $roundNumber?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (roundNumber == 1) {
                    _isRound1Confirmed = true;
                    _isRound1Answered = true; // Mark Round 1 as answered
                  } else if (roundNumber == 2) {
                    _isRound2Confirmed = true;
                    _isRound2Answered = true; // Mark Round 2 as answered
                  }
                  _resultMessage = 'Congratulations! You have been selected for Round $roundNumber!';
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (roundNumber == 1) {
                    _isRound1Confirmed = false;
                    _isRound1Answered = true; // Mark Round 1 as answered
                  } else if (roundNumber == 2) {
                    _isRound2Confirmed = false;
                    _isRound2Answered = true; // Mark Round 2 as answered
                  }
                  // Show "Better Luck Next Time" message when "No" is clicked
                  _resultMessage = 'Better Luck Next Time!';
                });
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
