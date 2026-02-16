import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Authservice {
  Dio dio = Dio();
  final box = GetStorage();
  Future<bool> login({required String phone}) async {
    try {
      Response response = await dio.post(
        'https://training.tamkeen-dev.com/herafi/public/api/login',
        data: {'phone': phone},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw response.data['message'] ?? 'Login Failed';
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error, Please check your internet';
      }
      throw e.response?.data["message"];
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }

  Future<bool> otp({required String phone, required String code}) async {
    try {
      Response response = await dio.post(
        'https://training.tamkeen-dev.com/herafi/public/api/verify',
        data: {"phone": phone, "otp": code},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        final token = response.data["data"]["token"];
        // print("Token: " + response.data['data']['token']);
        // final userData = response.data["data"]["user"];
        box.write('token', token);
        // box.write('user_info', userData);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error, Please check your internet';
      }
      throw e.response?.data["message"];
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }

  Future<bool> signup({
    required String phone,
    required String name,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        'https://training.tamkeen-dev.com/herafi/public/api/register',
        data: {"name": name, "phone": phone, "email": email},
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw 'Connection error, Please check your internet';
      }
      throw e.response?.data["message"];
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
