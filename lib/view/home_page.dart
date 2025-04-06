import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHomeAppBar(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to another page if needed
              },
              child: const Text('Welcome to Home Page!'),
            ),
          ),
        ],
      ),
    );
  }
}
