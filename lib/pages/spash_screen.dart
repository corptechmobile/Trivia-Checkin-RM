import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trivia_checkin/pages/input_page.dart';

class SpashScreen extends StatelessWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animation/Animation - 1717607835628.json'),
      ),
      nextScreen: const InputPage(),
      duration: 3500,
      backgroundColor: Colors.white,
    );
  }
}
