import 'package:get/get.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/features/cart/data_layer/models/cart_model.dart';
import 'package:online_store/features/cart/data_layer/service/cart_service.dart';

class CartController extends GetxController {
  final CartService cartService = CartService();
  RxBool isLoading = false.obs;
  RxBool isCompleting = false.obs;
  RxString errorMessage = ''.obs;
  RxList<CartModel> cartItems = <CartModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart({bool showError = true, bool showLoading = true}) async {
    if (showLoading) isLoading.value = true;
    errorMessage.value = '';
    try {
      final data = await cartService.getCart();
      cartItems.assignAll(data);
    } catch (e) {
      errorMessage.value = ApiError.from(e);
      if (showError) {
        Get.snackbar('Error', errorMessage.value);
      }
    } finally {
      if (showLoading) isLoading.value = false;
    }
  }

  Future<void> addItem(int productId, int quantity) async {
    try {
      await cartService.addToCart(productId, quantity);
      try {
        cartItems.assignAll(await cartService.getCart());
      } catch (_) {}
      Get.snackbar('Ok', 'The product has been added to the cart');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    }
  }

  Future<void> removeItem(CartModel item) async {
    try {
      await cartService.deleteFromCart(
        cartId: item.id,
        productId: item.product.id,
      );
      cartItems.removeWhere(
        (cartItem) =>
            cartItem.id == item.id || cartItem.product.id == item.product.id,
      );
      Get.snackbar('Ok', 'The product has been removed from the cart');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    }
  }

  Future<void> completeOrder() async {
    if (cartItems.isEmpty || isCompleting.value) return;
    try {
      isCompleting.value = true;
      await cartService.completeCart();
      cartItems.clear();
      Get.snackbar('Ok', 'The order has been completed successfully');
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    } finally {
      isCompleting.value = false;
    }
  }
}
