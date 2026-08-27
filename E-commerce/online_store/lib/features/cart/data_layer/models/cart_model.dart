import 'package:online_store/core/utils/parse_helper.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class CartModel {
  final int id;
  final int quantity;
  final ProductModel product;

  CartModel({required this.id, required this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final data = ParseHelper.mapOf(json);
    return CartModel(
      id: ParseHelper.toInt(
        data['id'] ?? data['cart_id'] ?? data['cart_item_id'],
      ),
      quantity: ParseHelper.toInt(data['quantity']),
      product: ProductModel.fromJson(ParseHelper.mapOf(data['product'])),
    );
  }

  static List<CartModel> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data']).map(CartModel.fromJson).toList();
  }
}
