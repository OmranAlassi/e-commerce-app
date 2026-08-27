import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/routing/routing_manager.dart';
import 'package:online_store/features/auth/busines_logic_layer/auth_controller.dart';
import 'package:online_store/features/auth/busines_logic_layer/otp_controller.dart';
import 'package:online_store/features/cart/busines_logic_layer/cart_controller.dart';
import 'package:online_store/features/favorite/busines_logic_layer/favorite_controller.dart';
import 'package:online_store/features/home/busines_logic_layer/home_controller.dart';
import 'package:online_store/features/product/busines_logic_layer/product_controller.dart';
import 'package:online_store/features/product/busines_logic_layer/product_details_controller.dart';
import 'package:online_store/features/profile/data_layer/models/user_model.dart';
import 'package:online_store/features/profile/data_layer/service/profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService profileService = ProfileService();
  final box = GetStorage();
  final ImagePicker _picker = ImagePicker();

  RxBool isLoading = false.obs;
  RxBool isUploading = false.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString image = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFromStorage();
    loadProfile();
  }

  void loadFromStorage() {
    name.value = box.read('user_name') ?? 'User';
    email.value = box.read('user_email') ?? '';
    phone.value = box.read('user_phone') ?? '';
    image.value = box.read('user_image') ?? '';
  }

  void _applyUser(User user) {
    if (user.name.isNotEmpty) name.value = user.name;
    if (user.email.isNotEmpty) email.value = user.email;
    if (user.phone.isNotEmpty) phone.value = user.phone;
    if (user.image.isNotEmpty) image.value = user.image;
    box.write('user_name', name.value);
    box.write('user_email', email.value);
    box.write('user_phone', phone.value);
    box.write('user_image', image.value);
    if (user.id != 0) box.write('user_id', user.id);
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    try {
      final user = await profileService.getProfile();
      _applyUser(user);
    } catch (e) {
      loadFromStorage();
      if (name.value.isEmpty || name.value == 'User') {
        Get.snackbar('Error', ApiError.from(e));
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeImage() async {
    try {
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (picked == null) return;
      isUploading.value = true;
      final user = await profileService.updateImage(picked.path);
      _applyUser(user);
      Get.snackbar('Ok', 'Profile image updated');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    } finally {
      isUploading.value = false;
    }
  }

  void logout() {
    box.remove('token');
    box.remove('user_name');
    box.remove('user_email');
    box.remove('user_phone');
    box.remove('user_image');
    box.remove('user_id');
    Get.offAllNamed(RoutingManager.loginScr);
    Future.microtask(() {
      _deleteController<CartController>();
      _deleteController<FavoriteController>();
      _deleteController<ProductController>();
      _deleteController<HomeController>();
      _deleteController<ProductDetailsController>();
      _deleteController<AuthController>();
      _deleteController<OtpController>();
      _deleteController<ProfileController>();
    });
  }

  void _deleteController<T>() {
    if (Get.isRegistered<T>()) {
      Get.delete<T>(force: true);
    }
  }
}
