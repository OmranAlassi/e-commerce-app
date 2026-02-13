import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/app_phone_input.dart';
import 'package:online_store/common/widgets/app_textformfiled.dart';
import 'package:online_store/common/widgets/appelevatedbutton.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/core/const/app_icon.dart';
import 'package:online_store/features/auth/busines_logic_layer/auth_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 24,
                children: [
                  Center(
                    child: SvgPicture.asset(AppIcon.splashIcon, height: 100),
                  ),
                  Text(
                    'Welcome back! Log in to continue',
                    style: GoogleFonts.lato(color: AppColor.b, fontSize: 19),
                  ),
                  AppPhoneInputBox(
                    controller: phoneController,
                    validator: authController.phoneValidator(),
                    textInputAction: TextInputAction.next,
                  ),
                  // Obx(
                  //   () => AppTextformfiled(
                  //     validator: authController.validatePassword(),
                  //     height: 50,
                  //     obscureText: authController.isobscure.value,
                  //     controller: passController,
                  //     keyboardType: TextInputType.visiblePassword,
                  //     prefixIcon: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 12),
                  //       // ignore: deprecated_member_use
                  //       child: SvgPicture.asset(
                  //         AppIcon.passw,
                  //         // ignore: deprecated_member_use
                  //         color: AppColor.b,
                  //       ),
                  //     ),
                  //     hintText: Text(
                  //       'Write Password...',
                  //       style: GoogleFonts.lato(color: AppColor.b2),
                  //     ),
                  //     suffixicon: InkWell(
                  //       onTap: () {
                  //         authController.isobscure.value =
                  //             !authController.isobscure.value;
                  //       },
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 12),
                  //         child: SvgPicture.asset(
                  //           authController.isobscure.value
                  //               ? AppIcon.eay2
                  //               : AppIcon.eay,
                  //         ),
                  //       ),
                  //     ),
                  //     textInputAction: TextInputAction.done,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  // ),
                  Obx(() {
                    return authController.isLoading.value
                        ? SpinKitCircle(color: AppColor.b)
                        : AppElevatedbutton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                authController.login(phoneController.text);
                              }
                            },
                            title: 'Login',
                            backgroundColor: AppColor.b3,
                          );
                  }),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 3,
                        children: [
                          Spacer(),
                          Text(
                            'Don’t have an account ?',
                            style: GoogleFonts.lato(color: AppColor.b),
                          ),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(RoutingManager.registerScr);
                            },
                            child: Text(
                              'Click here',
                              style: GoogleFonts.lato(
                                color: AppColor.b3,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.b3,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
