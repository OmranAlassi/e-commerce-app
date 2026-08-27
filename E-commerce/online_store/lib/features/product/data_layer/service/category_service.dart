import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/product/data_layer/models/category_model.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class CategoryService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(
        '${ApiHeaders.baseUrl}/category',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load categories');
        return CategoryModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to load categories';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<List<ProductModel>> getProductsByCategory(int id) async {
    try {
      final response = await dio.get(
        '${ApiHeaders.baseUrl}/category/$id',
        queryParameters: {'with_products': 1},
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load categories');
        return ProductModel.fromCategoryJson(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to load categories';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
