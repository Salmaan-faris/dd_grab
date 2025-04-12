import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';

/* ── provider ─────────────────────────────────────────────────────────── */
final productListProvider =
    StateNotifierProvider<ProductListVM, List<Product>>(
  (ref) => ProductListVM()..loadMock(),
);

/* ── view‑model ───────────────────────────────────────────────────────── */
class ProductListVM extends StateNotifier<List<Product>> {
  ProductListVM() : super([]);

  // mock data
  void loadMock() {
    state = [
      Product(
        id: '1',
        name: 'Redmi A4 5G (Starry Black, 4GB RAM, 64GB)',
        price: 9_499,
        mrp: 11_999,
        rating: 4.6,
        ratingCount: 851,
        image: 'assets/images/image 3.png',
        storageOptions: ['64 GB', '128 GB'],
      ),
      Product(
        id: '2',
        name: 'Apple iPhone 15 (128 GB) – Pink, 4GB RAM',
        price: 59_999,
        mrp: 69_900,
        rating: 4.7,
        ratingCount: 2_752,
        image: 'assets/images/image 3.png',
        storageOptions: ['128 GB', '256 GB'],
      ),
      // add more …
    ];
  }

  // toggle wishlist flag
  void toggleWishlist(String id) {
    state = [
      for (final p in state)
        p.id == id ? p.copyWith(isWishlisted: !p.isWishlisted) : p
    ];
  }
}
