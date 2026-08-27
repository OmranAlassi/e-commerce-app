import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/core/utils/parse_helper.dart';
import 'package:online_store/features/profile/data_layer/models/user_model.dart';

class ProfileService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();

  Future<User> getProfile() async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final response = await dio.get(
        '${ApiHeaders.baseUrl}/customer',
        options: ApiHeaders.authOptions(),
      );

      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Failed to load profile');
        return User.fromJson(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ?? 'Failed to load profile';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }

  Future<User> updateImage(String imagePath) async {
    try {
      final token = ApiHeaders.token();
      if (token == null) throw 'Please login first';

      final fileName = imagePath.split(RegExp(r'[\\/]')).last;
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath, filename: fileName),
      });

      Response response;
      try {
        response = await dio.post(
          '${ApiHeaders.baseUrl}/avatar',
          data: formData,
          options: ApiHeaders.authOptions(),
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if (status == 404 || status == 405) {
          final customerForm = FormData.fromMap({
            'name': box.read('user_name') ?? '',
            'email': box.read('user_email') ?? '',
            'phone': box.read('user_phone') ?? '',
            'image': await MultipartFile.fromFile(
              imagePath,
              filename: fileName,
            ),
          });
          response = await dio.post(
            '${ApiHeaders.baseUrl}/customer',
            data: customerForm,
            options: ApiHeaders.authOptions(),
          );
        } else {
          rethrow;
        }
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        ApiError.ensureSuccess(response.data, 'Failed to update image');
        if (response.data is Map) {
          final data = response.data['data'];
          if (data is Map || (response.data['id'] != null)) {
            return User.fromJson(Map<String, dynamic>.from(response.data));
          }
          final image = ParseHelper.imageUrl(
            data is Map ? (data['image'] ?? data['avatar']) : data,
          );
          if (image.isNotEmpty) {
            return User(
              id: ParseHelper.toInt(box.read('user_id')),
              name: ParseHelper.text(box.read('user_name')),
              email: ParseHelper.text(box.read('user_email')),
              phone: ParseHelper.text(box.read('user_phone')),
              image: image,
            );
          }
        }
        return getProfile();
      }
      throw ApiError.extractMessage(response.data) ?? 'Failed to update image';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
