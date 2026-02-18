// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class SearchService {
  final Dio dio = Dio();
  final box = GetStorage();

  Future<List<ProductModel>> searchProducts(String? query) async {
    try {
      var response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/product?search=$query',
        // queryParameters: {'search': query},
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return ProductModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Failed to load search results';
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error, check your internet connection';
      }
      throw e.response?.data['message'] ?? 'An error occurred while searching';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}
