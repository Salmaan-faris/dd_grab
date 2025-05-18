class CategoryModel {
  final int id;
  final int? parentId; // null for main category
  final String slug;
  final String name;
  late final String iconPath;

  /// Holds full data of each subcategory
  final List<Map<String, dynamic>> subcategories;

  CategoryModel({
    required this.id,
    required this.parentId,
    required this.slug,
    required this.name,
    required this.iconPath,
    required this.subcategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final slug = json['slug'] as String? ?? '';
    final List<Map<String, dynamic>> subs =
        (json['subcategories'] as List<dynamic>? ?? [])
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList();

    return CategoryModel(
      id: json['id'] as int,
      parentId: json['parent_id'] as int?,
      slug: slug,
      name: slug.replaceAll('-', ' ').toUpperCase(),
      iconPath: getIconPath(slug),
      subcategories: subs,
    );
  }

  static String getIconPath(String slug) {
    switch (slug) {
      case 'womens-fashion':
        return 'assets/images/haircare.png';
      case 'mens-fashion':
        return 'assets/images/jacket.png';
      case 'electronics':
        return 'assets/images/television.png';
      case 'home-appliances':
        return 'assets/images/sofa.png';
      case 'watches':
        return 'assets/images/wristwatch.png';
      case 'consumer-electronics':
        return 'assets/images/phone.png';
      case 'backpacks':
        return 'assets/images/bag.png';
      case 'toys':
        return 'assets/images/teddy-bear.png';
      default:
        return 'assets/images/default.png';
    }
  }
}
