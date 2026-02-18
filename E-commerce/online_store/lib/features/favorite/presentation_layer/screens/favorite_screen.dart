import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/favorite/busines_logic_layer/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  FavoriteScreen({super.key});

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
        title: Text('Favorite', style: GoogleFonts.lato(color: Colors.white)),
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (favoriteController.favorites.isEmpty) {
          return Center(
            child: Text(
              'No favorite products',
              style: GoogleFonts.lato(color: Colors.black),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: favoriteController.favorites.length,
          itemBuilder: (context, index) {
            final fav = favoriteController.favorites[index];
            final product = fav.product;

            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.image ?? '',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image_not_supported, color: AppColor.b),
                  ),
                ),
                title: Text(
                  product.name,
                  style: GoogleFonts.lato(color: Colors.black),
                ),
                subtitle: Text(
                  '${product.price} SYP',
                  style: GoogleFonts.lato(color: AppColor.b3),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                  onPressed: () =>
                      favoriteController.removeFavorite(product.id),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
