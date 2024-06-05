import 'package:flutter/material.dart';
import 'package:trivia_checkin/pages/input_page.dart';
import 'package:trivia_checkin/pages/spash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Checkin',
      theme: ThemeData(
        useMaterial3: false, 
      ),
      home: const SpashScreen(),
    );
  }
}
