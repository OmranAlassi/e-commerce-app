import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/routing/routing_manager.dart';

class ApiError {
  static bool _handling401 = false;

  static String from(Object e, {bool logoutOn401 = true}) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Connection timeout, please try again';
        case DioExceptionType.connectionError:
          return 'No internet connection, please check your network';
        case DioExceptionType.badCertificate:
          return 'Secure connection failed';
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.badResponse:
          return fromResponse(e.response, logoutOn401: logoutOn401);
        case DioExceptionType.unknown:
          return 'Cannot reach the server, please try again';
      }
    }
    final text = e.toString().trim();
    if (text.isEmpty || text == 'null') {
      return 'An unexpected error occurred';
    }
    return text.replaceFirst(RegExp(r'^Exception:\s*'), '');
  }

  static String fromResponse(Response? response, {bool logoutOn401 = true}) {
    final status = response?.statusCode ?? 0;
    final message = extractMessage(response?.data);

    if (status == 401) {
      if (logoutOn401) {
        handleUnauthorized();
      }
      return message ?? 'Session expired, please login again';
    }
    if (status == 403) {
      return message ?? 'You are not allowed to perform this action';
    }
    if (status == 404) {
      return message ?? 'Requested data was not found';
    }
    if (status == 422) {
      return message ?? 'Please check the entered data';
    }
    if (status >= 500) {
      return message ?? 'Server error, please try again later';
    }
    return message ?? 'Request failed';
  }

  static String? extractMessage(dynamic data) {
    if (data == null) return null;
    if (data is String) {
      final text = data.trim();
      if (text.isEmpty || text.startsWith('<')) return null;
      return text;
    }
    if (data is List && data.isNotEmpty) {
      return data.map((e) => e.toString()).join('\n');
    }
    if (data is Map) {
      final errors = data['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final parts = <String>[];
        for (final value in errors.values) {
          if (value is List) {
            parts.addAll(value.map((e) => e.toString()));
          } else if (value != null) {
            parts.add(value.toString());
          }
        }
        if (parts.isNotEmpty) return parts.join('\n');
      }

      final message = data['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message.trim();
      }
      if (message is List && message.isNotEmpty) {
        return message.map((e) => e.toString()).join('\n');
      }
      if (message is Map && message.isNotEmpty) {
        return message.values
            .expand((e) => e is List ? e : [e])
            .map((e) => e.toString())
            .join('\n');
      }
    }
    return null;
  }

  static void ensureSuccess(dynamic data, String fallback) {
    if (data is Map && data['code'] != null && data['code'] != 1) {
      throw extractMessage(data) ?? fallback;
    }
  }

  static void handleUnauthorized() {
    if (_handling401) return;
    _handling401 = true;
    final box = GetStorage();
    box.remove('token');
    if (Get.currentRoute != RoutingManager.loginScr) {
      Get.offAllNamed(RoutingManager.loginScr);
    }
    Future.delayed(const Duration(seconds: 1), () {
      _handling401 = false;
    });
  }
}
