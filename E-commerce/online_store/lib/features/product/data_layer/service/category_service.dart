import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';
import 'package:online_store/features/product/data_layer/models/category_model.dart';

class CategoryService {
  final Dio dio = Dio();
  final box = GetStorage();

  Future<List<CategoryModel>> getCategories() async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/category',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return CategoryModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Failed to load categories';
      }
    } catch (e) {
      throw 'An error occurred while loading the ratings: $e';
    }
  }

  Future<List<ProductModel>> getProductsByCategory(int id) async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/category/$id',
        queryParameters: {'with_products': 1},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['code'] == 1) {
        return ProductModel.fromCategoryJson(response.data);
      } else {
        throw response.data['message'] ?? 'Failed to load categories';
      }
    } catch (e) {
      throw 'An error occurred while loading the ratings: $e';
    }
  }
}
