import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final editProfileViewModelProvider = ChangeNotifierProvider(
  (ref) => EditProfileViewModel(),
);

class EditProfileViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> editProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('USER_TOKEN');

    if (token == null) {
      debugPrint('Token not found in SharedPreferences');
      return;
    }

    final url = Uri.parse(
      'https://dd-api.codesprint.cloud/api/v1/user/edit-profile',
    );

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'first_name': nameController.text.trim(),
          'last_name': lastname.text.trim(),
          'username': username.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        debugPrint('Profile updated successfully');
      } else {
        debugPrint('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error while updating profile: $e');
    }
  }
}
