import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel(),
);

class ProfileViewModel extends ChangeNotifier {
  String name = "Delight Benedict";
  String email = "delightmben@gmail.com";
  String phone = "9995300000";

  void editProfile(String newName, String newEmail, String newPhone) {
    name = newName;
    email = newEmail;
    phone = newPhone;
    notifyListeners();
  }
}
