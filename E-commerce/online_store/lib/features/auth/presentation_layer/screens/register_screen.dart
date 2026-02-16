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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    'Sign up to create account',
                    style: GoogleFonts.lato(color: AppColor.b, fontSize: 24),
                  ),

                  AppTextformfiled(
                    validator: authController.requiredFieldValidator(),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: AppColor.b,
                      size: 28,
                    ),
                    hintText: Text(
                      'Write Name...',
                      style: GoogleFonts.lato(color: AppColor.b2),
                    ),
                    textInputAction: TextInputAction.next,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  AppPhoneInputBox(
                    controller: phoneController,
                    validator: authController.phoneValidator(),
                    textInputAction: TextInputAction.next,
                  ),
                  AppTextformfiled(
                    validator: authController.emailValidator(),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email, color: AppColor.b, size: 25),
                    hintText: Text(
                      'Write Email...',
                      style: GoogleFonts.lato(color: AppColor.b2),
                    ),
                    textInputAction: TextInputAction.done,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  Obx(() {
                    return authController.isLoading.value
                        ? SpinKitCircle(color: AppColor.b)
                        : AppElevatedbutton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                authController.signup(
                                  phoneController.text,
                                  nameController.text,
                                  emailController.text,
                                );
                              }
                            },
                            title: 'Sign Up',
                            backgroundColor: AppColor.b3,
                          );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
