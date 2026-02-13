import 'package:get/get.dart';
import 'package:online_store/features/auth/presentation_layer/screens/login_screen.dart';
import 'package:online_store/features/auth/presentation_layer/screens/otp_screen.dart';
import 'package:online_store/features/auth/presentation_layer/screens/register_screen.dart';
import 'package:online_store/features/splash/presentation_layer/screens/splash_screen.dart';

class RoutingManager {
  static String splashScr = '/';
  static String loginScr = '/loginScr';
  static String registerScr = '/registerScr';
  static String superHomeScr = '/superHomeScr';
  static String otpScr = '/otpScr';

  static List<GetPage> getPages() {
    return [
      GetPage(name: splashScr, page: () => SplashScreen()),
      GetPage(name: loginScr, page: () => LoginScreen()),
      GetPage(name: superHomeScr, page: () => SplashScreen()),
      GetPage(name: registerScr, page: () => RegisterScreen()),
      GetPage(
        name: otpScr,
        page: () => OtpScreen(phone: Get.arguments as String),
      ),
    ];
  }
}
