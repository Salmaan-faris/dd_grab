import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

final productListProvider = StateNotifierProvider<ProductListVM, List<Product>>(
  (ref) => ProductListVM(),
);

class ProductListVM extends StateNotifier<List<Product>> {
  ProductListVM() : super([]);

  Future<void> fetchProductsByCategory(String categoryId) async {
    print('Fetching products for category ID: $categoryId');
    try {
      final url =
          'https://dd-api.codesprint.cloud/api/v1/product/category/$categoryId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List productsJson = jsonData['data'];
        state = productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        state = [];
      }
    } catch (e) {
      print("Failed to fetch products: $e");
      state = [];
    }
  }

  void toggleWishlist(String id) {
    state = [
      for (final p in state)
        p.id == id ? p.copyWith(isWishlisted: !p.isWishlisted) : p,
    ];
  }
}
