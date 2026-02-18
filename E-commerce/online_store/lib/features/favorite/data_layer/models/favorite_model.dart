import 'package:online_store/features/product/data_layer/models/product_model.dart';

class FavoriteModel {
  final int id;
  final ProductModel product;

  FavoriteModel({required this.id, required this.product});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
    );
  }

  static List<FavoriteModel> fromJsonList(Map<String, dynamic> json) {
    List<FavoriteModel> favorites = [];
    json['data'].forEach(
      (element) => favorites.add(FavoriteModel.fromJson(element)),
    );
    return favorites;
  }
}
