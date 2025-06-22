class Product {
  final String id;
  final String name; // thumbnail for the list
  final double price;
  final double mrp;
  final double rating;
  final int ratingCount;

  // extra fields you mentioned
  final String image; // hero / large image
  final List<String> storageOptions;

  // UI‑state
  final bool isWishlisted;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.mrp,
    required this.rating,
    required this.ratingCount,
    required this.image,
    required this.storageOptions,
    this.isWishlisted = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['slug'] ?? 'Unknown',
      price: double.tryParse(json['selling_price']?.toString() ?? '') ?? 0.0,
      mrp: double.tryParse(json['price']?.toString() ?? '') ?? 0.0,
      rating: 4.5, // You can replace this with actual data if needed
      ratingCount: 100, // Same here
      image:
          'https://ecom-stag.codesprint.cloud/storage/${json['images']?[0] ?? ''}',
      storageOptions: [],
    );
  }

  Product copyWith({bool? isWishlisted}) => Product(
    id: id,
    name: name,
    price: price,
    mrp: mrp,
    rating: rating,
    ratingCount: ratingCount,
    image: image,
    storageOptions: storageOptions,
    isWishlisted: isWishlisted ?? this.isWishlisted,
  );
}
