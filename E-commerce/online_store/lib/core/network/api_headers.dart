import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiHeaders {
  static const String baseUrl =
      'https://training.tamkeen-dev.com/herafi/public/api';

  static BaseOptions dioOptions() {
    return BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: const {'Accept': 'application/json'},
    );
  }

  static Options authOptions({Map<String, dynamic>? extra}) {
    final token = GetStorage().read('token');
    return Options(
      headers: {
        'Accept': 'application/json',
        if (token != null && token.toString().isNotEmpty)
          'Authorization': 'Bearer $token',
        ...?extra,
      },
    );
  }

  static String? token() {
    final value = GetStorage().read('token');
    if (value == null || value.toString().isEmpty) return null;
    return value.toString();
  }
}
