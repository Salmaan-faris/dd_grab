import 'package:dd_grab/view/carousel.dart';
import 'package:dd_grab/view/product_list.dart';
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
                  children: [
                    CategoryItem(
                      imagePath: 'assets/images/television.png',
                      label: 'Television',
                      onTap: () {
                        // navigate, filter, etc.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const ProductListPage(category: 'mobiles'),
                          ),
                        );
                      },
                    ),

                    CategoryItem(
                      imagePath: 'assets/images/jacket.png',
                      label: 'Fashion',
                      onTap: () {
                        // navigate, filter, etc.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const ProductListPage(category: 'mobiles'),
                          ),
                        );
                      },
                    ),
                    CategoryItem(
                      imagePath: 'assets/images/phone.png',
                      label: 'Mobile',
                      onTap: () {
                        // navigate, filter, etc.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const ProductListPage(category: 'mobiles'),
                          ),
                        );
                      },
                    ),
                    CategoryItem(
                      imagePath: 'assets/images/sofa.png',
                      label: 'Furniture',
                      onTap: () {
                        // navigate, filter, etc.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const ProductListPage(category: 'mobiles'),
                          ),
                        );
                      },
                    ),
                    CategoryItem(
                      imagePath: 'assets/images/headphones.png',
                      label: 'Headphone',
                      onTap: () {
                        // navigate, filter, etc.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const ProductListPage(category: 'mobiles'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Promo Banner
            BannerCarousel(),

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
                    imageUrl: "assets/images/Rectangle 84.png",
                  ),
                  _DealsCard(
                    title: "Up to 50% off",
                    imageUrl: "assets/images/image.png",
                  ),
                  _DealsCard(
                    title: "Under ₹799",
                    imageUrl: "assets/images/Rectangle 84 (1).png",
                  ),
                  _DealsCard(
                    title: "From ₹399",
                    imageUrl: "assets/images/Rectangle1.png",
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
                    imageUrl: "assets/images/phone2.png",
                  ),
                  _DealsCard(
                    title: "Air Purifier",
                    imageUrl: "assets/images/airpurifier.png",
                  ),
                  _DealsCard(
                    title: "Dining Sets",
                    imageUrl: "assets/images/table.png",
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
class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap; // 👈  optional tap callback

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 👈  fires when tapped
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
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
