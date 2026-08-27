import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/app_error_view.dart';
import 'package:online_store/common/widgets/app_network_image.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/cart/busines_logic_layer/cart_controller.dart';
import 'package:online_store/features/cart/data_layer/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
        ),
        backgroundColor: AppColor.b,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Cart', style: GoogleFonts.lato(color: Colors.white)),
      ),

      body: Obx(() {
        if (cartController.isLoading.value) {
          return Center(child: SpinKitCircle(color: AppColor.b));
        }
        if (cartController.errorMessage.value.isNotEmpty &&
            cartController.cartItems.isEmpty) {
          return AppErrorView(
            message: cartController.errorMessage.value,
            onRetry: cartController.loadCart,
          );
        }
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('The basket is empty'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final CartModel item = cartController.cartItems[index];

            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AppNetworkImage(
                        url: item.product.image,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: GoogleFonts.lato(color: Colors.black),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Quantity: ${item.quantity}',
                            style: GoogleFonts.lato(color: Colors.black),
                          ),
                          Text(
                            'Price: ${item.product.price} SYP',
                            style: GoogleFonts.lato(color: AppColor.b3),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        cartController.removeItem(item);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        final total = cartController.cartItems.fold<int>(
          0,
          (sum, item) => sum + (item.product.price * item.quantity),
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: $total SYP',
                style: GoogleFonts.lato(color: Colors.black, fontSize: 19),
              ),
              ElevatedButton(
                onPressed:
                    cartController.cartItems.isEmpty ||
                        cartController.isCompleting.value
                    ? null
                    : cartController.completeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.b3,
                  disabledBackgroundColor: AppColor.b3,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: cartController.isCompleting.value
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Complete',
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
