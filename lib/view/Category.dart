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
          const CustomHomeAppBar(),
          const Expanded(child: CategoryBody()),
        ],
      ),
    );
  }
}

/* ───────────────────────── Category Body ─────────────────────────────── */
class CategoryBody extends ConsumerWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(categoryViewModelProvider);

    // Loading state
    if (vm.categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Row(
      children: [
        /* ───────── Left vertical main‑category menu ───────── */
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: vm.categories.length,
              itemBuilder: (context, i) {
                final cat = vm.categories[i];
                final selected = vm.selectedIndex == i;

                return GestureDetector(
                  onTap:
                      () =>
                          ref.read(categoryViewModelProvider).selectCategory(i),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selected ? Colors.white : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(cat.iconPath, width: 32, height: 32),
                        const SizedBox(height: 6),
                        Text(
                          cat.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color:
                                selected ? Colors.black : Colors.grey.shade600,
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
        ),

        /* ───────── Right list of sub‑categories ───────── */
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child:
                vm.currentSubcategories.isEmpty
                    ? const Center(child: Text('No sub‑categories'))
                    : ListView.separated(
                      itemCount: vm.currentSubcategories.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (_, idx) {
                        final slug = vm.currentSubcategories[idx];
                        final pretty =
                            slug.replaceAll('-', ' ').toUpperCase(); // format
                        return Text(
                          pretty,
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
