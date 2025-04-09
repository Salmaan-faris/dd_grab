import 'package:dd_grab/models/savings_model.dart';
import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomHomeAppBar(), Expanded(child: SavingsPage1())],
      ),
    );
  }
}

class SavingsPage1 extends ConsumerWidget {
  const SavingsPage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(savingsViewModelProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Savings Plan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...viewModel.savingsPlans.map((item) => SavingsCard(item: item)),

            const SizedBox(height: 24),
            const Text(
              "Upcoming Coupons",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...viewModel.upcomingCoupons.map(
              (item) => SavingsCard(item: item, isDimmed: true),
            ),
          ],
        ),
      ),
    );
  }
}

class SavingsCard extends StatelessWidget {
  final SavingsItem item;
  final bool isDimmed;

  const SavingsCard({super.key, required this.item, this.isDimmed = false});

  @override
  Widget build(BuildContext context) {
    final opacity = isDimmed ? 0.3 : 1.0;

    return Opacity(
      opacity: opacity,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            // Galaxy Image placeholder
            Container(
              height: 60,
              width: 40,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/galaxytag.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 10),

            // Info Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.amount,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("(Nine Thousand)", style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14),
                      const SizedBox(width: 4),
                      Text(item.date, style: const TextStyle(fontSize: 12)),
                      const Spacer(),
                      Text(item.code, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Arrow Image placeholder
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/greybutton.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
