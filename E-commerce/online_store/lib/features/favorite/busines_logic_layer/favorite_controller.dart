import 'package:get/get.dart';
import 'package:online_store/features/favorite/data_layer/models/favorite_model.dart';
import 'package:online_store/features/favorite/data_layer/service/favorite_service.dart';

class FavoriteController extends GetxController {
  final FavoriteService favoriteService = FavoriteService();

  var isLoading = false.obs;
  var favorites = <FavoriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    try {
      favorites.value = await favoriteService.getFavorites();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(int productId) async {
    try {
      await favoriteService.addToFavorite(productId);
      await loadFavorites();
      Get.snackbar('Ok', 'The product has been added to favorites');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> removeFavorite(int productId) async {
    try {
      await favoriteService.deleteFromFavorite(productId);
      favorites.removeWhere((item) => item.product.id == productId);
      Get.snackbar('Ok', 'The product has been removed from favorites');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  bool isFavorite(int productId) {
    return favorites.any((f) => f.product.id == productId);
  }
}
