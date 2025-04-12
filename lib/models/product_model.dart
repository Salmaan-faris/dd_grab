class Product {
  final String id;
  final String name;      // thumbnail for the list
  final double price;
  final double mrp;
  final double rating;
  final int ratingCount;

  // extra fields you mentioned
  final String image;           // hero / large image
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
