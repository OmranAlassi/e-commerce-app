import 'package:online_store/core/utils/parse_helper.dart';
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
    final data = ParseHelper.mapOf(json);
    return ProductModel(
      id: ParseHelper.toInt(data['id']),
      name: ParseHelper.text(data['name']),
      description: data['description']?.toString(),
      price: ParseHelper.toInt(data['price']),
      image: ParseHelper.imageUrl(data['image']),
      category: data['category'] != null
          ? CategoryModel.fromJson(ParseHelper.mapOf(data['category']))
          : null,
      isFavorite: ParseHelper.toBool(data['is_favorite']),
    );
  }

  static List<ProductModel> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data'])
        .map(ProductModel.fromJson)
        .toList();
  }

  static List<ProductModel> fromCategoryJson(Map<String, dynamic> json) {
    final data = json['data'];
    dynamic products;
    if (data is Map) {
      products = data['products'];
    }
    return ParseHelper.mapList(products).map(ProductModel.fromJson).toList();
  }
}
