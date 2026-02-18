import 'package:get/get.dart';
import 'package:online_store/features/cart/data_layer/models/cart_model.dart';
import 'package:online_store/features/cart/data_layer/service/cart_service.dart';

class CartController extends GetxController {
  final CartService cartService = CartService();
  RxBool isLoading = false.obs;
  RxList<CartModel> cartItems = <CartModel>[].obs;
  Future<void> loadCart() async {
    isLoading.value = true;
    try {
      final data = await cartService.getCart();
      cartItems.addAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addItem(int productId, int quantity) async {
    try {
      await cartService.addToCart(productId, quantity);
      await loadCart();
      Get.snackbar('Ok', 'The product has been added to the cart');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> removeItem(int productId) async {
    try {
      await cartService.deleteFromCart(productId);
      cartItems.removeWhere((item) => item.product.id == productId);
      Get.snackbar('Ok', 'The product has been removed from the cart');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
