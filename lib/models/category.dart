class Category {
  final String category;

  Category({required this.category});
  factory Category.fromJson(String json) {
    return Category(category: json);
  }
}
