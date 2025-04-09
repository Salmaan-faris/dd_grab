import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:dd_grab/viewmodels/category_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHomeAppBar(),
          Expanded(
            child: CategoryBody(), // This ensures it lays out properly
          ),
        ],
      ),
    );
  }
}

class CategoryBody extends ConsumerWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(categoryViewModelProvider);

    return Row(
      children: [
        // Left vertical category menu
        Container(
          width: 100,
          color: Colors.grey[100],
          child: ListView.builder(
            itemCount: viewModel.categories.length,
            itemBuilder: (context, index) {
              final category = viewModel.categories[index];
              final isSelected = viewModel.selectedIndex == index;

              return GestureDetector(
                onTap:
                    () => ref
                        .read(categoryViewModelProvider)
                        .selectCategory(index),
                child: Container(
                  color: isSelected ? Colors.white : Colors.grey[100],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(category.iconPath, width: 32, height: 32),
                      const SizedBox(height: 6),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.black : Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Right subcategory list
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ListView.separated(
              itemCount: viewModel.currentSubcategories.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                return Text(
                  viewModel.currentSubcategories[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
