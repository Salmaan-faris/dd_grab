import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _CategoryItem(icon: Icons.tv, label: "Television"),
                    _CategoryItem(
                      icon: Icons.checkroom_outlined,
                      label: "Fashion",
                    ),
                    _CategoryItem(icon: Icons.phone_android, label: "Mobile"),
                    _CategoryItem(
                      icon: Icons.chair_alt_outlined,
                      label: "Furniture",
                    ),
                    _CategoryItem(icon: Icons.headphones, label: "Headphone"),
                  ],
                ),
              ),
            ),

            // Promo Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Up 50% off',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Iphone 16 + 128 GB',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      bottom: 16,
                      child: Image.asset(
                        'assets/images/iphone.png', // Replace with your banner image
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Deals You Will Love
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Deals You Will Love",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: const [
                  _DealsCard(
                    title: "Today’s Deal",
                    imageUrl: "assets/images/deal1.png",
                  ),
                  _DealsCard(
                    title: "Up to 50% off",
                    imageUrl: "assets/images/deal2.png",
                  ),
                  _DealsCard(
                    title: "Under ₹799",
                    imageUrl: "assets/images/deal3.png",
                  ),
                  _DealsCard(
                    title: "From ₹399",
                    imageUrl: "assets/images/deal4.png",
                  ),
                ],
              ),
            ),

            // Recommendations for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recommendations for you",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: const [
                  _DealsCard(
                    title: "Hair Care",
                    imageUrl: "assets/images/haircare.png",
                  ),
                  _DealsCard(
                    title: "iPhone 15 Plus",
                    imageUrl: "assets/images/iphone15plus.png",
                  ),
                  _DealsCard(
                    title: "Air Purifier",
                    imageUrl: "assets/images/airpurifier.png",
                  ),
                  _DealsCard(
                    title: "Dining Sets",
                    imageUrl: "assets/images/diningset.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// CATEGORY ITEM
class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.black87),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// DEALS / RECOMMENDATION CARD
class _DealsCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const _DealsCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imageUrl, fit: BoxFit.contain),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
