import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Give it some fixed height or let the parent constrain it
      height: 220, // Adjust as needed
      child: Stack(
        children: [
          // 1) Yellow background with rounded corners
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow[600], // bright lime-y color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),

          // 2) Wavy lines image on top
          //    If the image is actually white and opaque,
          //    it will cover your yellow color. Make sure
          //    it's transparent or partially transparent.
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/appbarlines.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/appbarlines.png',
              fit: BoxFit.cover,
            ),
          ),

          // 3) The AppBar content
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Location" label
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Location',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),

                // Location row + badge icons
                Row(
                  children: [
                    // Left side: location icon + text
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 4),
                        Text(
                          'Cochin, Kerala - 683520',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    // Right side: cart & notifications with badges
                    Row(
                      children: [
                        _iconWithBadge(
                          imagePath: 'assets/images/shopping-cart 1.png',
                          count: 3,
                        ),
                        const SizedBox(width: 16),
                        _iconWithBadge(
                          imagePath: 'assets/images/alarm-bell 1.png',
                          count: 1,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Search Bar + Filter icon
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIcon: const Icon(CupertinoIcons.search),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
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
                      child: const Icon(Icons.tune_sharp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Simple badge widget that displays a custom image
  // with a red badge if count > 0
  Widget _iconWithBadge({required String imagePath, required int count}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The white container behind the icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(imagePath, width: 24, height: 24),
        ),

        // The red circle badge
        if (count > 0)
          Positioned(
            right: 2,
            top: -1,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
      ],
    );
  }
}
