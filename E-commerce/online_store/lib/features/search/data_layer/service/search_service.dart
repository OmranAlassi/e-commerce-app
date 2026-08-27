// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';

class SearchService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<List<ProductModel>> searchProducts(String? query) async {
    try {
      var response = await dio.get(
        '${ApiHeaders.baseUrl}/product',
        queryParameters: {'search': query},
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load search results');
        return ProductModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to load search results';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
