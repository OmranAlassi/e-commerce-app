import 'package:online_store/core/utils/parse_helper.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class FavoriteModel {
  final int id;
  final ProductModel product;

  FavoriteModel({required this.id, required this.product});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    final data = ParseHelper.mapOf(json);
    return FavoriteModel(
      id: ParseHelper.toInt(data['id']),
      product: ProductModel.fromJson(ParseHelper.mapOf(data['product'])),
    );
  }

  static List<FavoriteModel> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data'])
        .map(FavoriteModel.fromJson)
        .toList();
  }
}
