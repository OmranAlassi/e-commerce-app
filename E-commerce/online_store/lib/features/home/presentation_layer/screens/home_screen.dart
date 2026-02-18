import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/app_textformfiled.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/home/busines_logic_layer/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(backgroundColor: Colors.black),
              Text('omran'),
            ],
          ),
        ),
        titleSpacing: 25,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                AppTextformfiled(
                  keyboardType: TextInputType.webSearch,
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/search-svgrepo-com.svg',
                    height: 2,
                  ),
                  hintText: Text(
                    'Search...',
                    style: GoogleFonts.lato(color: AppColor.b2),
                  ),
                  textInputAction: TextInputAction.search,
                  borderRadius: BorderRadius.circular(12),
                ),
                SizedBox(height: 16),
                Obx(() {
                  if (homeController.isLoadingSliders.value) {
                    return Center(child: SpinKitCircle(color: AppColor.b));
                  }

                  if (homeController.sliders.isEmpty) {
                    return Image.asset(
                      'assets/images/20241202124802482.png',
                      fit: BoxFit.cover,
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

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
