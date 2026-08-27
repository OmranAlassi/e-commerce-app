import 'package:get/get.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/features/product/data_layer/models/product_model.dart';
import 'package:online_store/features/search/data_layer/service/search_service.dart';

class ProductSearchController extends GetxController {
  final SearchService searchService = SearchService();
  RxBool isLoading = false.obs;
  RxList<ProductModel> results = <ProductModel>[].obs;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      results.clear();
      return;
    }
    isLoading.value = true;
    try {
      results.value = await searchService.searchProducts(query);
    } catch (e) {
      Get.snackbar('Error', ApiError.from(e));
    } finally {
      isLoading.value = false;
    }
  }
}
