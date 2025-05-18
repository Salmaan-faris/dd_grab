import 'package:dd_grab/view/Category.dart';
import 'package:dd_grab/view/bottom_nav_bar.dart';
import 'package:dd_grab/view/home_page.dart';
import 'package:dd_grab/view/myproifle.dart';
// import 'package:dd_grab/view/savings.dart';
import 'package:dd_grab/view/wishlist.dart';
import 'package:dd_grab/viewmodels/bottom_nav_bar_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavigationPage extends ConsumerWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    final screens = const [
      HomePage(),
      CategoryPage(),
      WishlistPage(),
      // SavingsPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: const BottomNavBarWidget(), // ✅ Use it here
    );
  }
}
