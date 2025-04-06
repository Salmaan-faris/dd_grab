// lib/widgets/custom_home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF2E84E), // light yellow
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          ),
          // Location and Cart Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 6),
                  Text(
                    'Cochin, Kerala - 683520',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _iconWithBadge(icon: Icons.shopping_cart, count: 3),
                  const SizedBox(width: 12),
                  _iconWithBadge(icon: Icons.notifications, count: 1),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Search Bar + Filter Button
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.tune),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _iconWithBadge({required IconData icon, required int count}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        if (count > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
