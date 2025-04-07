import 'package:dd_grab/view/bottom_nav_bar.dart';
import 'package:dd_grab/view/main_navigation_page.dart';
import 'package:dd_grab/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainNavigationPage(), // Navigates to HomePage on start
      ),
    );
  }
}
