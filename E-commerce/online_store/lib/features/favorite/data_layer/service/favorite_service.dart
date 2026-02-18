import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/favorite/data_layer/models/favorite_model.dart';

class FavoriteService {
  final Dio dio = Dio();
  final box = GetStorage();

  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/favorite',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200 && response.data['code'] == 1) {
        return FavoriteModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Favorites failed to load';
      }
    } catch (e) {
      throw 'An error occurred while loading the favorites: $e';
    }
  }

  Future<void> addToFavorite(int productId) async {
    try {
      final token = box.read('token');
      await dio.post(
        'https://training.tamkeen-dev.com/herafi/public/api/favorite',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {'product_id': productId},
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw 'Connection error, check your internet connection';
      }
      throw e.response?.data['message'] ?? 'Favorites failed to load';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  Future<void> deleteFromFavorite(int productId) async {
    try {
      final token = box.read('token');
      // print('Token used: $token');
      final response = await dio.delete(
        'https://training.tamkeen-dev.com/herafi/public/api/favorite/$productId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return;
      }

      if (response.statusCode != 200 || response.data['code'] != 1) {
        throw response.data['message'] ?? 'Failed to delete favorites';
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw 'Connection error, check your internet connection';
      }
      throw e.response?.data['message'] ?? 'Failed to delete favorites';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}
