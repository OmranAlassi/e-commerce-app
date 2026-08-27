import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/favorite/data_layer/models/favorite_model.dart';

class FavoriteService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.get(
        '${ApiHeaders.baseUrl}/favorite',
        options: ApiHeaders.authOptions(),
      );
      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Favorites failed to load');
        return FavoriteModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ??
          'Favorites failed to load';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<void> addToFavorite(int productId) async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.post(
        '${ApiHeaders.baseUrl}/favorite',
        options: ApiHeaders.authOptions(),
        data: {'product_id': productId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        ApiError.ensureSuccess(response.data, 'Failed to add to favorites');
        return;
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to add to favorites';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<void> deleteFromFavorite(int productId) async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.delete(
        '${ApiHeaders.baseUrl}/favorite/$productId',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        if (response.data is Map) {
          ApiError.ensureSuccess(response.data, 'Failed to delete favorites');
        }
        return;
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to delete favorites';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
