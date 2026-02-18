// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:online_store/features/cart/busines_logic_layer/cart_controller.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';
import 'package:online_store/features/product/data_layer/service/product_service.dart';

class ProductDetailsController extends GetxController {
  final ProductService pService = ProductService();

  final CartController cService = Get.put(CartController());

  RxBool isLoading = false.obs;
  Rxn<ProductModel> product = Rxn<ProductModel>();
  RxInt quantity = 1.obs;

  Future<void> loadProduct(int id) async {
    isLoading.value = true;
    try {
      product.value = await pService.getProductDetails(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity() => quantity.value++;
  void decreaseQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  void addToCart() {
    if (product.value != null) {
      cService.addItem(product.value!.id, quantity.value);
    }
  }
}
