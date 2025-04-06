import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dd_grab/view_model/bottom_nav_bar_vm.dart';

class BottomNavBarWidget extends ConsumerWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final viewModel = ref.read(bottomNavProvider.notifier);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: viewModel.setIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[500],
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/home 1.png',
            height: 24,
            width: 24,
            color: currentIndex == 0 ? Colors.black : Colors.grey[500],
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/categories 1.png',
            height: 24,
            width: 24,
            color: currentIndex == 1 ? Colors.black : Colors.grey[500],
          ),
          label: "Category",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/heart 1.png',
            height: 24,
            width: 24,
            color: currentIndex == 2 ? Colors.black : Colors.grey[500],
          ),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/save-money 1.png',
            height: 24,
            width: 24,
            color: currentIndex == 3 ? Colors.black : Colors.grey[500],
          ),
          label: "Savings",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/user 1.png',
            height: 24,
            width: 24,
            color: currentIndex == 4 ? Colors.black : Colors.grey[500],
          ),
          label: "My Profile",
        ),
      ],
    );
  }
}
