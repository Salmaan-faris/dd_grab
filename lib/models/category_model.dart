class CategoryModel {
  final String name;
  final String iconPath; // Local asset path
  final List<String> subcategories;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.subcategories,
  });
}
