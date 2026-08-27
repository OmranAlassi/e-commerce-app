import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/network/api_headers.dart';
import 'package:online_store/features/home/data_layer/models/slider_model.dart';

class HomeService {
  final Dio dio = Dio(ApiHeaders.dioOptions());
  final box = GetStorage();
  Future<List<SliderModel>> getSliders() async {
    try {
      final response = await dio.get(
        '${ApiHeaders.baseUrl}/slider',
        options: ApiHeaders.authOptions(),
      );
      if (response.statusCode == 200) {
        ApiError.ensureSuccess(response.data, 'Slider loading failed');
        return SliderModel.fromJsonList(
          response.data is Map ? Map<String, dynamic>.from(response.data) : {},
        );
      }
      throw ApiError.extractMessage(response.data) ?? 'Slider loading failed';
    } on DioException catch (e) {
      throw ApiError.from(e);
    } catch (e) {
      throw ApiError.from(e);
    }
  }
}
