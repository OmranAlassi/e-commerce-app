import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/cart/presentation_layer/screens/cart_screen.dart';
import 'package:online_store/features/favorite/presentation_layer/screens/favorite_screen.dart';
import 'package:online_store/features/home/presentation_layer/screens/home_screen.dart';
import 'package:online_store/features/profile/presentation_layer/screens/profile_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class SuperhomeScreen extends StatelessWidget {
  const SuperhomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomeScreen(),
            item: ItemConfig(
              activeForegroundColor: AppColor.b,
              icon: SvgPicture.asset(
                'assets/icons/home-angle-2-svgrepo-com.svg',
                height: 28,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: CartScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                'assets/icons/cart-large-minimalistic-svgrepo-com.svg',
                height: 33,
              ),
              activeForegroundColor: AppColor.b,
            ),
          ),
          PersistentTabConfig(
            screen: FavoriteScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                'assets/icons/favorites-svgrepo-com.svg',
                height: 40,
              ),
              activeForegroundColor: AppColor.b,
            ),
          ),
          PersistentTabConfig(
            screen: ProfileScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                'assets/icons/profile-svgrepo-com.svg',
                height: 33,
              ),
              activeForegroundColor: AppColor.b,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style10BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
