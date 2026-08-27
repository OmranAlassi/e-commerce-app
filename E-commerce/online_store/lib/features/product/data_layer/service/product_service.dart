import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class ProductService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        '${ApiHeaders.baseUrl}/product',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load products');
        return ProductModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ?? 'Failed to load products';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<ProductModel> getProductDetails(int id) async {
    try {
      final response = await dio.get(
        '${ApiHeaders.baseUrl}/product/$id',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load product details');
        final data = response.data is Map ? response.data['data'] : null;
        if (data is! Map) throw 'Failed to load product details';
        return ProductModel.fromJson(Map<String, dynamic>.from(data));
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to load product details';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
