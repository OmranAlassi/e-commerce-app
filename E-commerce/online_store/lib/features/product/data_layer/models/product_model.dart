import 'package:online_store/features/product/data_layer/models/category_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String? description;
  final int price;
  final String? image;
  final CategoryModel? category;
  final bool? isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.image,
    this.category,
    this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      isFavorite: json['is_favorite'],
    );
  }

  static List<ProductModel> fromJsonList(Map<String, dynamic> json) {
    List<ProductModel> products = [];
    json['data'].forEach(
      (element) => products.add(ProductModel.fromJson(element)),
    );
    return products;
  }

  static List<ProductModel> fromCategoryJson(Map<String, dynamic> json) {
    List<ProductModel> products = [];
    json['data']['products'].forEach(
      (element) => products.add(ProductModel.fromJson(element)),
    );
    return products;
  }
}
