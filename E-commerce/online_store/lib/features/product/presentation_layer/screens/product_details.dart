import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/app_error_view.dart';
import 'package:online_store/common/widgets/app_network_image.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/favorite/busines_logic_layer/favorite_controller.dart';
import 'package:online_store/features/product/busines_logic_layer/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
    final favController = Get.put(FavoriteController());
    controller.loadProduct(productId);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: AppColor.b,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 65,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
        ),
        title: Text(
          'Product details',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        actions: [
          Obx(() {
            final isFav = favController.isFavorite(productId);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.redAccent : Colors.white,
              ),
              onPressed: () {
                if (isFav) {
                  favController.removeFavorite(productId);
                } else {
                  favController.addFavorite(productId);
                }
              },
            );
          }),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: SpinKitCircle(color: AppColor.b));
        }
        if (controller.errorMessage.value.isNotEmpty &&
            controller.product.value == null) {
          return AppErrorView(
            message: controller.errorMessage.value,
            onRetry: () {
              controller.loadProduct(productId, force: true);
            },
          );
        }
        final p = controller.product.value;
        if (p == null) {
          return Center(child: Text('The product was not found.'));
        }

        return Center(
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppNetworkImage(
                  url: p.image,
                  width: double.infinity,
                  height: 250,
                  iconSize: 60,
                ),
              ),
              SizedBox(height: 16),
              Text(p.name, style: GoogleFonts.lato(color: Colors.black)),
              SizedBox(height: 8),
              Text(
                '${p.price} SYP',
                style: GoogleFonts.lato(color: AppColor.b3),
              ),

              SizedBox(height: 16),
              Text(
                p.description ?? 'There is no description',
                style: GoogleFonts.lato(color: Colors.black),
              ),
              SizedBox(height: 60),
            ],
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        final p = controller.product.value;
        if (p == null) return SizedBox();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: controller.decreaseQuantity,
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      '${controller.quantity.value}',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: controller.increaseQuantity,
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.isAdding.value
                      ? null
                      : controller.addToCart,
                  icon: controller.isAdding.value
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/cart-large-minimalistic-svgrepo-com.svg',
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        ),
                  label: Text(
                    'Add to cart',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.b3,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
