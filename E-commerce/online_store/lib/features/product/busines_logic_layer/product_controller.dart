import 'package:get/get.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';
import 'package:online_store/features/product/data_layer/service/product_service.dart';
import 'package:online_store/features/product/data_layer/models/category_model.dart';
import 'package:online_store/features/product/data_layer/service/category_service.dart';

class ProductController extends GetxController {
  final ProductService pService = ProductService();
  final CategoryService cService = CategoryService();
  RxBool isLoading = false.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxInt selectedCategoryId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadProducts();
  }

  Future<void> loadCategories() async {
    try {
      categories.value = await cService.getCategories();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    try {
      products.value = await pService.getProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectCategory(int id) async {
    selectedCategoryId.value = id;
    if (id == 0) {
      loadProducts();
      return;
    }

    isLoading.value = true;
    try {
      products.value = await cService.getProductsByCategory(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
