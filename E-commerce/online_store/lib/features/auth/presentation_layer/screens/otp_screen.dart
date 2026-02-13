import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:online_store/common/widgets/appelevatedbutton.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/auth/busines_logic_layer/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phone});
  final String phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomPaint(
              controller: codeController,
              validator: authController.requiredFieldValidator(
                'Please fill out this field',
              ),
            ),
            SizedBox(height: 24),
            Column(
              spacing: 7,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3,
                  children: [],
                ),

                SizedBox(height: 24),
                Obx(() {
                  return authController.isLoading.value
                      ? SpinKitCircle(color: AppColor.b)
                      : AppElevatedbutton(
                          backgroundColor: AppColor.b3,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              (phone, codeController.text);
                            }
                          },
                          title: 'Verify',
                        );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
