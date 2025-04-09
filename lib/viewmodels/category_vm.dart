import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category_model.dart';

final categoryViewModelProvider = ChangeNotifierProvider(
  (ref) => CategoryViewModel(),
);

class CategoryViewModel extends ChangeNotifier {
  final List<CategoryModel> _categories = [
    CategoryModel(
      name: 'Electronics',
      iconPath: 'assets/images/television.png',
      subcategories: ['Laptops', 'Mobiles', 'Speakers'],
    ),
    CategoryModel(
      name: 'Men’s Fashion',
      iconPath: 'assets/images/jacket.png',
      subcategories: ['Shirts', 'Sportswear', 'Belts', 'Pants', 'Formal Shoes'],
    ),
    CategoryModel(
      name: 'Home Appliances',
      iconPath: 'assets/images/sofa.png',
      subcategories: ['AC', 'Washing Machine'],
    ),
    CategoryModel(
      name: 'Watches',
      iconPath: 'assets/images/wristwatch.png',
      subcategories: ['Analog', 'Digital'],
    ),
    CategoryModel(
      name: 'Backpacks',
      iconPath: 'assets/images/bag.png',
      subcategories: ['Laptop Bags', 'Casual'],
    ),
    CategoryModel(
      name: 'Toys',
      iconPath: 'assets/images/teddy-bear.png',
      subcategories: ['Educational', 'Action Figures'],
    ),
  ];

  int _selectedIndex = 0;

  List<CategoryModel> get categories => _categories;
  int get selectedIndex => _selectedIndex;
  List<String> get currentSubcategories =>
      _categories[_selectedIndex].subcategories;

  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
