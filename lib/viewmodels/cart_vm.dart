import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  int quantity = 2;

  void updateQuantity(int newQty) {
    quantity = newQty;
    notifyListeners();
  }

  double get itemPrice => 9499;
  double get convenienceFee => 199;
  double get totalAmount => itemPrice * quantity + convenienceFee;
}
