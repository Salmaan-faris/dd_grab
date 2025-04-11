import 'package:dd_grab/view/editprofile.dart';
import 'package:dd_grab/view/reusable_appbar.dart';
import 'package:dd_grab/viewmodels/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileVM = ref.watch(profileViewModelProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),

                  // Profile Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black12),
                      ],
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.black,
                          child: Text(
                            "DB",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileVM.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                profileVM.email,
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                profileVM.phone,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfilePage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Image.asset('assets/images/rewards.png', height: 80),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    _RewardRow(
                                      label: "RewardStatus",
                                      value: "Unpaid",
                                    ),
                                    _RewardRow(
                                      label: "Wallet Balance",
                                      value: "23,000 INR",
                                    ),
                                    _RewardRow(
                                      label: "Unused Balance",
                                      value: "22,000 INR",
                                    ),
                                    _RewardRow(
                                      label: "Total",
                                      value: "66,000 INR",
                                    ),
                                    _RewardRow(
                                      label: "Used Amount",
                                      value: "12,000 INR",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  _profileOption(title: "Orders"),
                  Divider(color: Colors.grey.shade300),
                  _profileOption(title: "Address"),
                  Divider(color: Colors.grey.shade300),
                  _profileOption(title: "Help"),
                  Divider(color: Colors.grey.shade300),
                  _profileOption(title: "Returns & Refunds"),
                  Divider(color: Colors.grey.shade300),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption({required String title}) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward, size: 16),
      onTap: () {},
    );
  }
}

class _RewardRow extends StatelessWidget {
  final String label;
  final String value;
  const _RewardRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
