import 'dart:async';
import 'package:dd_grab/view/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF212121),
      body: Center(
        child: Image.asset(
          'assets/images/ddgrab_icon.png', // Make sure to add this image to your assets
          fit: BoxFit.cover,
          height: 60,
        ),
      ),
    );
  }
}
