import 'package:dd_grab/models/whislist_model.dart';
import 'package:flutter/material.dart';

class WishlistViewModel extends ChangeNotifier {
  final List<WishlistItem> _items = [
    WishlistItem(
      image: 'assets/images/bag.png',
      name: 'Redmi A4 5G (Starry Black, 4GB RAM, 64GB)',
      rating: 4.5,
      ratingCount: 851,
      price: '₹9,499',
      mrp: '₹11,999',
    ),
    WishlistItem(
      image: 'assets/images/phone.png',
      name: 'Apple iPhone 15 (128 GB) - Pink, 4GB RAM',
      rating: 4.8,
      ratingCount: 2752,
      price: '₹59,999',
      mrp: '₹69,999',
    ),
  ];

  List<WishlistItem> get items => _items;

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
