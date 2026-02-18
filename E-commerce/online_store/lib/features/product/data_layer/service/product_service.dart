import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class ProductService {
  final Dio dio = Dio();
  final box = GetStorage();

  Future<List<ProductModel>> getProducts() async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/product',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return ProductModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Failed to load products';
      }
    } catch (e) {
      throw 'An error occurred while loading the products: $e';
    }
  }

  Future<ProductModel> getProductDetails(int id) async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/product/$id',

        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return ProductModel.fromJson(response.data['data']);
      } else {
        throw response.data['message'] ?? 'Failed to load products';
      }
    } catch (e) {
      throw 'An error occurred while loading the products: $e';
    }
  }
}
