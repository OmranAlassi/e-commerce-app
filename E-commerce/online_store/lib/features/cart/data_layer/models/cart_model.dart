import 'package:online_store/features/product/data_layer/models/product_model.dart';

class CartModel {
  final int id;
  final int quantity;
  final ProductModel product;

  CartModel({required this.id, required this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      product: ProductModel.fromJson(json['product'] ?? {}),
    );
  }

  static List<CartModel> fromJsonList(Map<String, dynamic> json) {
    final List<CartModel> cart = [];
    json['data'].forEach((element) => cart.add(CartModel.fromJson(element)));
    return cart;
  }
}
