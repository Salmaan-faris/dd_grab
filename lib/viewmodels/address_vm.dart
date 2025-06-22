import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

final addressViewModelProvider =
    StateNotifierProvider<AddressViewModel, AddressState>((ref) {
      return AddressViewModel();
    });

final addressFormProvider = StateProvider<Map<String, String>>(
  (ref) => {
    'first_name': '',
    'last_name': '',
    'address_1': '',
    'address_2': '',
    'city': '',
    'state': '',
    'zip': '',
    'country': '',
  },
);

class AddressViewModel extends StateNotifier<AddressState> {
  AddressViewModel() : super(AddressState.initial());

  Future<void> fetchAddresses() async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('USER_TOKEN') ?? '';

      final response = await http.get(
        Uri.parse("https://dd-api.codesprint.cloud/api/v1/user/get-addresses"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final addresses = List<Map<String, dynamic>>.from(data['data']);
          state = state.copyWith(isLoading: false, addresses: addresses);
        } else {
          state = state.copyWith(
            isLoading: false,
            error: 'Failed to load addresses',
          );
        }
      } else {
        state = state.copyWith(isLoading: false, error: 'Server error');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addAddress(Map<String, String> formData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token') ?? '';

      final response = await http.post(
        Uri.parse("https://dd-api.codesprint.cloud/api/v1/user/add-address"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(formData),
      );

      if (response.statusCode == 200) {
        await fetchAddresses();
      } else {
        throw Exception('Failed to add address');
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

class AddressState {
  final List<Map<String, dynamic>> addresses;
  final bool isLoading;
  final String error;

  AddressState({
    required this.addresses,
    required this.isLoading,
    required this.error,
  });

  factory AddressState.initial() =>
      AddressState(addresses: [], isLoading: false, error: '');

  AddressState copyWith({
    List<Map<String, dynamic>>? addresses,
    bool? isLoading,
    String? error,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
