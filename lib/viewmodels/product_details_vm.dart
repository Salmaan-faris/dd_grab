
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {

  ProductDetailsViewModel();

  String selectedStorage = '';
  String enteredPincode = '';

  void selectStorage(String storage) {
    selectedStorage = storage;
    notifyListeners();
  }

  void setPincode(String pincode) {
    enteredPincode = pincode;
    notifyListeners();
  }

  void checkDelivery() {
    // Simulate delivery check
    // You could make an API call here
    debugPrint("Checking delivery for: $enteredPincode");
  }
}
