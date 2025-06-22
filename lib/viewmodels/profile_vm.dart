import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel(),
);

class ProfileViewModel extends ChangeNotifier {
  String name = "Delight Benedict";
  String lastname = "";
  String username = "";
  String email = "delightmben@gmail.com";
  String phone = "9995300000";

  bool _hasFetchedProfileData = false;

  void editProfile(
    String newName,
    String newEmail,
    String newPhone,
    String newLastname,
    String newusername,
  ) {
    name = newName;
    lastname = newLastname;
    username = newusername;

    email = newEmail;
    phone = newPhone;
    notifyListeners();
  }

  Future<void> fetchProfileData() async {
    if (_hasFetchedProfileData) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('USER_TOKEN');
    if (token == null) {
      debugPrint('No token found in SharedPreferences');
      return;
    }
    debugPrint('Token: $token');

    final url = Uri.parse(
      'https://dd-api.codesprint.cloud/api/v1/user/profile',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final userData = responseData['data'];

        name = userData['first_name'] + ' ' + userData['last_name'];
        email = userData['email'];
        phone = userData['phone'];
        lastname = userData['last_name'];
        username = userData['username'];
        _hasFetchedProfileData = true;
        notifyListeners();
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      debugPrint('Error fetching profile data: $e');
    }
  }
}
