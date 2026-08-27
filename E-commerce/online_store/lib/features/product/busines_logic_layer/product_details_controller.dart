// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/features/cart/busines_logic_layer/cart_controller.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';
import 'package:online_store/features/product/data_layer/service/product_service.dart';

class ProductDetailsController extends GetxController {
  final ProductService pService = ProductService();

  final CartController cService = Get.put(CartController());

  RxBool isLoading = false.obs;
  RxBool isAdding = false.obs;
  RxString errorMessage = ''.obs;
  Rxn<ProductModel> product = Rxn<ProductModel>();
  RxInt quantity = 1.obs;
  int? _loadedId;

  Future<void> loadProduct(int id, {bool force = false}) async {
    if (!force &&
        _loadedId == id &&
        (product.value != null || isLoading.value)) {
      return;
    }
    _loadedId = id;
    isLoading.value = true;
    errorMessage.value = '';
    product.value = null;
    quantity.value = 1;
    try {
      product.value = await pService.getProductDetails(id);
    } catch (e) {
      errorMessage.value = ApiError.from(e);
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity() => quantity.value++;
  void decreaseQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  Future<void> addToCart() async {
    if (product.value == null || isAdding.value) return;
    try {
      isAdding.value = true;
      await cService.addItem(product.value!.id, quantity.value);
    } finally {
      isAdding.value = false;
    }
  }
}
