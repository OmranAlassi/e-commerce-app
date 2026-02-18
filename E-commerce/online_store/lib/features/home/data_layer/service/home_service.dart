import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/features/home/data_layer/models/slider_model.dart';

class HomeService {
  final Dio dio = Dio();
  final box = GetStorage();
  Future<List<SliderModel>> getSliders() async {
    try {
      String? token = box.read('token');
      final response = await dio.get(
        'https://training.tamkeen-dev.com/herafi/public/api/slider',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return SliderModel.fromJsonList(response.data);
      } else {
        throw response.data['message'] ?? 'Slider loading failed';
      }
    } catch (e) {
      throw 'An error occurred while loading the slider: $e';
    }
  }
}
