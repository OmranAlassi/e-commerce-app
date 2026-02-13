import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/routing/routing_manager.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      String? token = box.read('token');
      if (token == null || token.isEmpty) {
        Get.offNamed(RoutingManager.loginScr);
      } else {
        Get.offNamed(RoutingManager.superHomeScr);
      }
    });
  }
}
