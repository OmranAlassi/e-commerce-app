import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/core/utils/parse_helper.dart';

class Authservice {
  Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<bool> login({required String phone}) async {
    try {
      Response response = await dio.post(
        '${ApiHeaders.baseUrl}/login',
        data: {'phone': phone},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Login Failed');
        return true;
      }
      throw ApiError.extractMessage(response.data) ?? 'Login Failed';
    } on DioException catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    } catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    }
  }

  Future<bool> otp({required String phone, required String code}) async {
    try {
      Response response = await dio.post(
        '${ApiHeaders.baseUrl}/verify',
        data: {"phone": phone, "otp": code},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'OTP verification failed');
        final data = ParseHelper.mapOf(
          response.data is Map ? response.data['data'] : null,
        );
        _saveUser(data, fallbackPhone: phone);
        return true;
      }
      throw ApiError.extractMessage(response.data) ?? 'OTP verification failed';
    } on DioException catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    } catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    }
  }

  Future<bool> signup({
    required String phone,
    required String name,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        '${ApiHeaders.baseUrl}/register',
        data: {"name": name, "phone": phone, "email": email},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Signup Failed');
        return true;
      }
      throw ApiError.extractMessage(response.data) ?? 'Signup Failed';
    } on DioException catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    } catch (e) {
      throw ApiError.from(e, logoutOn401: false);
    }
  }

  void _saveUser(Map<String, dynamic> data, {String? fallbackPhone}) {
    final token = data['token']?.toString();
    if (token != null && token.isNotEmpty) {
      box.write('token', token);
    }
    box.write('user_name', ParseHelper.text(data['name']));
    box.write('user_email', ParseHelper.text(data['email']));
    box.write(
      'user_phone',
      ParseHelper.text(data['phone'], fallback: fallbackPhone ?? ''),
    );
    box.write(
      'user_image',
      ParseHelper.imageUrl(data['image'] ?? data['avatar']),
    );
    box.write('user_id', ParseHelper.toInt(data['id']));
  }
}
