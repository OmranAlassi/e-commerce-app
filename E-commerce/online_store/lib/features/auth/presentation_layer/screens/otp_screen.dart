import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/appelevatedbutton.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/auth/busines_logic_layer/auth_controller.dart';
import 'package:online_store/features/auth/busines_logic_layer/otp_controller.dart';
import 'package:online_store/features/auth/presentation_layer/widgets/custom_pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phone});
  final String phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OtpController otpController = Get.put(OtpController());
  final AuthController authController = Get.put(AuthController());
  final TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            'Verify your Phone number',
                            style: GoogleFonts.lato(
                              color: AppColor.b,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Enter the 5-digit OTP sent to : $phone',
                            style: GoogleFonts.lato(
                              color: AppColor.b,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      CustomPinput(
                        controller: codeController,
                        validator: authController.requiredFieldValidator(),
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 3,
                        children: [
                          Text(
                            'Didn’t receive code ?',
                            style: GoogleFonts.lato(
                              color: AppColor.b,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              otpController.timeText,
                              style: GoogleFonts.lato(
                                color: AppColor.b3,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }),
                        ],
                      ),

                      InkWell(
                        onTap: () {
                          if (otpController.seconds.value == 0) {
                            otpController.startTimer();
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please Wait The timer to resend the code',
                              backgroundColor: Color(
                                0XFFCF362E,
                                // ignore: deprecated_member_use
                              ).withOpacity(0.5),
                            );
                          }
                        },
                        child: Text(
                          'Resend Code',
                          style: GoogleFonts.lato(
                            color: AppColor.b,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Obx(() {
                        return authController.isLoading.value
                            ? SpinKitCircle(color: AppColor.b)
                            : AppElevatedbutton(
                                backgroundColor: AppColor.b3,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    authController.otp(
                                      phone,
                                      codeController.text,
                                    );
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
          ),
        ],
      ),
    );
  }
}
