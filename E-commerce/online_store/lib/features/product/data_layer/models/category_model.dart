class CategoryModel {
  final int id;
  final String name;
  final String? image;

  CategoryModel({required this.id, required this.name, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  static List<CategoryModel> fromJsonList(Map<String, dynamic> json) {
    List<CategoryModel> categories = [];
    json['data'].forEach(
      (element) => categories.add(CategoryModel.fromJson(element)),
    );
    return categories;
  }
}
