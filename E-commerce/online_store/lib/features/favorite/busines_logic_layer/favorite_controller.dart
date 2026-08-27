import 'package:get/get.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/features/favorite/data_layer/models/favorite_model.dart';
import 'package:online_store/features/favorite/data_layer/service/favorite_service.dart';

class FavoriteController extends GetxController {
  final FavoriteService favoriteService = FavoriteService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var favorites = <FavoriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites({bool showError = true, bool showLoading = true}) async {
    if (showLoading) isLoading.value = true;
    errorMessage.value = '';
    try {
      favorites.value = await favoriteService.getFavorites();
    } catch (e) {
      errorMessage.value = ApiError.from(e);
      if (showError) {
        Get.snackbar('Error', errorMessage.value);
      }
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  Future<void> addFavorite(int productId) async {
    try {
      await favoriteService.addToFavorite(productId);
      try {
        favorites.value = await favoriteService.getFavorites();
      } catch (_) {}
      Get.snackbar('Ok', 'The product has been added to favorites');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    }
  }

  Future<void> removeFavorite(int productId) async {
    try {
      await favoriteService.deleteFromFavorite(productId);
      favorites.removeWhere((item) => item.product.id == productId);
      Get.snackbar('Ok', 'The product has been removed from favorites');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    }
  }

  bool isFavorite(int productId) {
    return favorites.any((f) => f.product.id == productId);
  }
}
