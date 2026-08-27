import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/cart/data_layer/models/cart_model.dart';

class CartService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  bool _canFallback(DioException e) {
    final status = e.response?.statusCode;
    return status == 404 || status == 405;
  }

  Future<List<CartModel>> getCart() async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.get(
        '${ApiHeaders.baseUrl}/cart',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load Cart');
        return CartModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ?? 'Failed to load Cart';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<void> addToCart(int productId, int quantity) async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.post(
        '${ApiHeaders.baseUrl}/cart',
        data: {'product_id': productId, 'quantity': quantity},
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ApiError.ensureSuccess(response.data, 'Failed to add to Cart');
        return;
      }
      throw ApiError.extractMessage(response.data) ?? 'Failed to add to Cart';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<void> deleteFromCart({
    required int cartId,
    required int productId,
  }) async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final urls = <String>[
        if (cartId > 0) '${ApiHeaders.baseUrl}/cart/$cartId',
        if (productId > 0 && productId != cartId)
          '${ApiHeaders.baseUrl}/cart/$productId',
      ];

      Response? response;
      DioException? lastError;

      for (final url in urls) {
        try {
          response = await dio.delete(url, options: ApiHeaders.authOptions());
          lastError = null;
          break;
        } on DioException catch (e) {
          lastError = e;
          if (!_canFallback(e)) rethrow;
        }
      }

      if (response == null && cartId > 0) {
        try {
          response = await dio.post(
            '${ApiHeaders.baseUrl}/cart/$cartId',
            data: {'_method': 'DELETE', 'product_id': productId},
            options: ApiHeaders.authOptions(),
          );
          lastError = null;
        } on DioException catch (e) {
          lastError = e;
        }
      }

      if (response == null) {
        throw lastError != null
            ? ApiError.from(lastError)
            : 'Failed to remove from Cart';
      }

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        if (response.data is Map) {
          ApiError.ensureSuccess(response.data, 'Failed to remove from Cart');
        }
        return;
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to remove from Cart';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<void> completeCart() async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final attempts = [
        (path: '/cart/complete', allowGet: true),
        (path: '/order', allowGet: false),
        (path: '/cart/checkout', allowGet: true),
      ];
      Response? response;
      DioException? lastError;

      for (final attempt in attempts) {
        try {
          response = await dio.post(
            '${ApiHeaders.baseUrl}${attempt.path}',
            options: ApiHeaders.authOptions(),
          );
          lastError = null;
          break;
        } on DioException catch (e) {
          lastError = e;
          if (e.response?.statusCode == 405 && attempt.allowGet) {
            try {
              response = await dio.get(
                '${ApiHeaders.baseUrl}${attempt.path}',
                options: ApiHeaders.authOptions(),
              );
              lastError = null;
              break;
            } on DioException catch (getError) {
              lastError = getError;
              if (!_canFallback(getError)) rethrow;
            }
          } else if (!_canFallback(e)) {
            rethrow;
          }
        }
      }

      if (response == null) {
        throw lastError != null
            ? ApiError.from(lastError)
            : 'Failed to complete the order';
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        ApiError.ensureSuccess(response.data, 'Failed to complete the order');
        return;
      }
      throw ApiError.extractMessage(response.data) ??
          'Failed to complete the order';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
