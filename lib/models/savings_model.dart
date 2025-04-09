import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savingsViewModelProvider = ChangeNotifierProvider<SavingsViewModel>(
  (ref) => SavingsViewModel(),
);

class SavingsItem {
  final String amount;
  final String date;
  final String code;

  SavingsItem({required this.amount, required this.date, required this.code});
}

class SavingsViewModel extends ChangeNotifier {
  final List<SavingsItem> savingsPlans = [
    SavingsItem(amount: '₹9,000', date: '5 February, 2025', code: '67789832'),
    SavingsItem(amount: '₹9,000', date: '5 February, 2025', code: '67789832'),
    SavingsItem(amount: '₹9,000', date: '5 February, 2025', code: '67789832'),
  ];

  final List<SavingsItem> upcomingCoupons = [
    SavingsItem(amount: '₹9,000', date: '5 February, 2025', code: '67789832'),
    SavingsItem(amount: '₹9,000', date: '5 February, 2025', code: '67789832'),
  ];
}
