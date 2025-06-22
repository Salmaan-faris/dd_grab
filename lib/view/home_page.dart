import 'package:dd_grab/view/carousel.dart';
import 'package:dd_grab/view/category_item.dart';
import 'package:dd_grab/view/deals_card.dart';
import 'package:dd_grab/view/product_list.dart';
import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: Builder(
                  builder: (context) {
                    final viewModel = ref.watch(homeViewModelProvider);

                    if (viewModel.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (viewModel.hasError) {
                      return const Center(
                        child: Text('Error loading categories'),
                      );
                    } else {
                      return Row(
                        children: List.generate(viewModel.categories.length, (
                          i,
                        ) {
                          final cat = viewModel.categories[i];
                          final slug = cat.slug;
                          return SizedBox(
                            width: 80,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryItem(
                                  imagePath: cat.iconPath,
                                  label:
                                      slug.replaceAll('-', ' ').toUpperCase(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => ProductListPage(
                                              categoryId: slug,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    }
                  },
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
                  DealsCard(
                    title: "Today’s Deal",
                    imageUrl: "assets/images/Rectangle 84.png",
                  ),
                  DealsCard(
                    title: "Up to 50% off",
                    imageUrl: "assets/images/image.png",
                  ),
                  DealsCard(
                    title: "Under ₹799",
                    imageUrl: "assets/images/Rectangle 84 (1).png",
                  ),
                  DealsCard(
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
                  DealsCard(
                    title: "Hair Care",
                    imageUrl: "assets/images/haircare.png",
                  ),
                  DealsCard(
                    title: "iPhone 15 Plus",
                    imageUrl: "assets/images/phone2.png",
                  ),
                  DealsCard(
                    title: "Air Purifier",
                    imageUrl: "assets/images/airpurifier.png",
                  ),
                  DealsCard(
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
