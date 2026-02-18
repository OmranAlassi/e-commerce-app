import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/home/busines_logic_layer/home_controller.dart';
import 'package:online_store/features/product/busines_logic_layer/product_controller.dart';
import 'package:online_store/features/product/presentation_layer/screens/product_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final box = GetStorage();
  HomeScreen({super.key});
  final ProductController productController = Get.put(ProductController());
  final HomeController homeController = Get.put(HomeController());
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final String userName = box.read('user_name') ?? 'User';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.b,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            spacing: 8,
            children: [
              CircleAvatar(backgroundColor: Colors.white),
              Obx(() {
                return Text(
                  userName,
                  style: GoogleFonts.lato(color: Colors.white),
                );
              }),
            ],
          ),
        ),
        titleSpacing: 25,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Obx(() {
                  if (homeController.isLoadingSliders.value) {
                    return Center(child: SpinKitCircle(color: AppColor.b));
                  }

                  if (homeController.sliders.isEmpty) {
                    return Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/20241202124802482.png',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  }
                  return Column(
                    spacing: 24,
                    children: [
                      CarouselSlider(
                        carouselController: _controller,
                        items: homeController.sliders.map((slider) {
                          return Image.network(
                            slider.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 160.25,
                          viewportFraction: 0.95,
                          padEnds: false,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            homeController.currentIndex.value = index;
                          },
                        ),
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: homeController.currentIndex.value,
                        count: homeController.sliders.length,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            width: 30,
                            height: 9,
                            color: AppColor.b3,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          dotDecoration: DotDecoration(
                            width: 11,
                            height: 10,
                            color: AppColor.b,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          spacing: 4,
                        ),
                        onDotClicked: (index) {
                          _controller.animateToPage(index);
                        },
                      ),
                    ],
                  );
                }),
                SizedBox(height: 16),
                Text(
                  'Categories',
                  style: GoogleFonts.lato(color: Colors.black, fontSize: 22),
                ),
                Obx(() {
                  if (productController.isLoading.value) {
                    return Center(child: SpinKitCircle(color: AppColor.b));
                  }
                  return SizedBox(
                    height: 80,
                    child: Obx(() {
                      if (productController.categories.isEmpty) {
                        return Center(
                          child: Text(
                            'There are no ratings',
                            style: GoogleFonts.lato(color: AppColor.b),
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.categories.length,
                        itemBuilder: (context, index) {
                          final ctg = productController.categories[index];
                          // ignore: unused_local_variable
                          final isSelected =
                              productController.selectedCategoryId.value ==
                              ctg.id;
                          return InkWell(
                            onTap: () =>
                                productController.selectCategory(ctg.id),
                            child: Container(
                              width: 90,
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColor.b : Colors.black12,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  ctg.name,
                                  style: GoogleFonts.lato(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  );
                }),

                Text(
                  'Products',
                  style: GoogleFonts.lato(color: Colors.black, fontSize: 22),
                ),

                Obx(() {
                  if (productController.isLoading.value) {
                    return Center(child: SpinKitCircle(color: AppColor.b));
                  }
                  if (productController.products.isEmpty) {
                    return Center(
                      child: Text(
                        'There are no products',
                        style: GoogleFonts.lato(color: AppColor.b3),
                      ),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      final p = productController.products[index];
                      return InkWell(
                        onTap: () =>
                            Get.to(() => ProductDetailsScreen(productId: p.id)),
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    p.image ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                          Icons.image_not_supported,
                                          size: 60,
                                          color: AppColor.b,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  p.name,
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                '${p.price} SYP',
                                style: GoogleFonts.lato(
                                  color: AppColor.b3,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
