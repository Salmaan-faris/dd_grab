import 'dart:convert';
import 'package:dd_grab/main.dart';
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

  bool loading = false;
  bool initialized = false;

  Future<bool> editProfile() async {
    if (nameController.text.trim().isEmpty ||
        lastname.text.trim().isEmpty ||
        username.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      loading = false;
      notifyListeners();
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }

    bool updated = false;
    loading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('USER_TOKEN');

    if (token == null) {
      debugPrint('Token not found in SharedPreferences');
      loading = false;
      notifyListeners();
      return updated;
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

      debugPrint(
        'Request Body: ${jsonEncode({'first_name': nameController.text.trim(), 'last_name': lastname.text.trim(), 'username': username.text.trim(), 'email': emailController.text.trim(), 'phone': phoneController.text.trim()})}',
      );
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('Profile updated successfully');
        updated = true;
        await fetchProfile();
      } else {
        debugPrint('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error while updating profile: $e');
    }

    loading = false;
    notifyListeners();
    return updated;
  }

  Future<void> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('USER_TOKEN');

    if (token == null) return;

    final url = Uri.parse(
      'https://dd-api.codesprint.cloud/api/v1/user/profile',
    );
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        nameController.text = data['first_name'] ?? '';
        lastname.text = data['last_name'] ?? '';
        username.text = data['username'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneController.text = data['phone'] ?? '';
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Failed to fetch profile: $e');
    }
  }
}
