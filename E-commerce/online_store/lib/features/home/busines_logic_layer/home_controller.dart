import 'package:flutter/rendering.dart';
import 'package:get/get.dart' hide Trans;
import 'package:online_store/features/home/data_layer/models/slider_model.dart';
import 'package:online_store/features/home/data_layer/service/home_service.dart';

class HomeController extends GetxController {
  final HomeService homeService = HomeService();

  RxInt currentIndex = 0.obs;
  RxInt selectedCategory = 0.obs;
  RxBool isLoadingSliders = false.obs;

  RxList<SliderModel> sliders = <SliderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadSliders();
  }

  Future<void> loadSliders() async {
    isLoadingSliders.value = true;
    try {
      sliders.value = await homeService.getSliders();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    } finally {
      isLoadingSliders.value = false;
    }
  }
}
