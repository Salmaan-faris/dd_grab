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
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Galaxy Image placeholder
            Container(
              height: 80,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.amount,
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff2162A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        const Text(
                          "(Nine Thousand)",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      color: Colors.grey.shade300,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 25,
                            color: Color(0xff2162A1),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.date,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "# ${item.code}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Arrow Image placeholder
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                color: Colors.grey,
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
