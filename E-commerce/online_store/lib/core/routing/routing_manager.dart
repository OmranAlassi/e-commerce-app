import 'package:get/get.dart';
import 'package:online_store/features/auth/presentation_layer/screens/login_screen.dart';
import 'package:online_store/features/auth/presentation_layer/screens/otp_screen.dart';
import 'package:online_store/features/auth/presentation_layer/screens/register_screen.dart';
import 'package:online_store/features/cart/presentation_layer/screens/cart_screen.dart';
import 'package:online_store/features/favorite/presentation_layer/screens/favorite_screen.dart';
import 'package:online_store/features/home/presentation_layer/screens/home_screen.dart';
import 'package:online_store/features/home/presentation_layer/screens/superhome_screen.dart';
import 'package:online_store/features/splash/presentation_layer/screens/splash_screen.dart';

class RoutingManager {
  static String splashScr = '/';
  static String loginScr = '/loginScr';
  static String registerScr = '/registerScr';
  static String superHomeScr = '/superHomeScr';
  static String otpScr = '/otpScr';
  static String cartScr = '/cartScr';
  static String homeScr = '/homeScr';
  static String favoriteScr = '/favoriteScr';
  static List<GetPage> getPages() {
    return [
      GetPage(name: splashScr, page: () => SplashScreen()),
      GetPage(name: loginScr, page: () => LoginScreen()),
      GetPage(name: superHomeScr, page: () => SuperhomeScreen()),
      GetPage(name: registerScr, page: () => RegisterScreen()),
      GetPage(
        name: otpScr,
        page: () => OtpScreen(phone: Get.arguments ?? ''),
      ),
      GetPage(name: cartScr, page: () => CartScreen()),
      GetPage(name: homeScr, page: () => HomeScreen()),
      GetPage(name: favoriteScr, page: () => FavoriteScreen()),
    ];
  }
}
