import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/cart/data_layer/models/cart_model.dart';

class CartService {
  final Dio dio = Dio();
  final box = GetStorage();

  Future<List<CartModel>> getCart() async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/cart',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return CartModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Failed to load Cart';
      }
    } catch (e) {
      throw 'An error occurred while loading the Cart: $e';
    }
  }

  Future<void> addToCart(int productId, int quantity) async {
    try {
      final token = box.read('token');
      final response = await dio.post(
        'https://training.tamkeen-dev.com/herafi/public/api/cart',
        data: {'product_id': productId, 'quantity': quantity},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200 || response.data['code'] != 1) {
        throw response.data['message'] ?? 'Failed to add to Cart';
      }
    } catch (e) {
      throw 'An error occurred while loading the Cart: $e';
    }
  }

  Future<void> deleteFromCart(int productId) async {
    try {
      final token = box.read('token');
      final response = await dio.delete(
        'https://training.tamkeen-dev.com/herafi/public/api/cart',
        data: {'product_id': productId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200 || response.data['code'] != 1) {
        throw response.data['message'] ?? 'Failed to add to Cart';
      }
    } catch (e) {
      throw 'An error occurred while loading the Cart: $e';
    }
  }
}
