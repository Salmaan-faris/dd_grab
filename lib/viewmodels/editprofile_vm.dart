import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProfileViewModelProvider = ChangeNotifierProvider(
  (ref) => EditProfileViewModel(),
);

class EditProfileViewModel extends ChangeNotifier {
  final nameController = TextEditingController(text: 'Delight Benedict');
  final emailController = TextEditingController(
    text: 'delightricher@gmail.com',
  );
  final addressController = TextEditingController(text: '239F, Vayenazh');
  final cityController = TextEditingController(text: 'Kochi');
  final stateController = TextEditingController(text: 'Kerala');
  final pincodeController = TextEditingController(text: '239F, Vayenazh');
  final passwordController = TextEditingController();

  void saveProfile() {
    // Call API or save logic
    debugPrint('Profile Saved');
  }
}
