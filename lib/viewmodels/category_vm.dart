import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

final categoryViewModelProvider =
    ChangeNotifierProvider((ref) => CategoryViewModel());

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  int _selectedIndex = 0;

  List<CategoryModel> get categories => _categories;
  int get selectedIndex => _selectedIndex;

  /// convenience getter for the UI
  List<String> get currentSubcategories =>
      _categories.isNotEmpty ? _categories[_selectedIndex].subcategories : [];

  CategoryViewModel() {
    fetchMainCategories();
  }

  /* ───────────────────────────────────────── Main categories ───────────── */
  Future<void> fetchMainCategories() async {
    try {
      final res = await http.get(
        Uri.parse('https://dd-api.codesprint.cloud/api/v1/category/main'),
      );

      if (res.statusCode != 200) {
        debugPrint('Main cat error: ${res.statusCode}');
        return;
      }

      final List data = jsonDecode(res.body)['data'];
      _categories = data.map((e) => CategoryModel.fromJson(e)).toList();
      notifyListeners();

      if (_categories.isNotEmpty) {
        await fetchSubcategories(0);          // preload first category’s subs
      }
    } catch (e) {
      debugPrint('Main cat exception: $e');
    }
  }

  /* ───────────────────────────────────────── Sub‑categories ────────────── */
  Future<void> fetchSubcategories(int index) async {
    final parent = _categories[index];

    try {
      final res = await http.get(
        Uri.parse(
          'https://dd-api.codesprint.cloud/api/v1/category/list/${parent.parentId}',
        ),
      );

      if (res.statusCode != 200) {
        debugPrint('Subcat error: ${res.statusCode}');
        return;
      }

      final List data = jsonDecode(res.body)['data'];

      /// store ONLY slug strings
      _categories[index].subcategories =
          data.map<String>((e) => e[''] as String).toList();

      notifyListeners();
    } catch (e) {
      debugPrint('Subcat exception: $e');
    }
  }

  /* ───────────────────────────────────────── UI interaction ────────────── */
  void selectCategory(int index) {
    _selectedIndex = index;
    fetchSubcategories(index);          // async fetch for that parent
    notifyListeners();
  }
}
