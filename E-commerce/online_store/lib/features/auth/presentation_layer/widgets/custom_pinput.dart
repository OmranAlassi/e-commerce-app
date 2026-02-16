import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class CustomPinput extends StatelessWidget {
  CustomPinput({super.key, required this.controller, required this.validator});
  TextEditingController controller;
  String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      errorPinTheme: PinTheme(
        width: MediaQuery.of(context).size.width * 0.18,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0XFFA348BB)),
        ),
      ),
      errorTextStyle: GoogleFonts.lato(
        color: Colors.red,
        height: 1.4,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      controller: controller,
      validator: validator,
      cursor: Container(width: 1, height: 25, color: Color(0XFFA348BB)),
      preFilledWidget: Text(
        '-',
        style: GoogleFonts.cairo(
          color: AppColor.b3,
          fontSize: 18,
          letterSpacing: 0.2,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
      ),
      defaultPinTheme: PinTheme(
        width: MediaQuery.of(context).size.width * 0.18,
        height: 55,
        textStyle: GoogleFonts.cairo(
          color: Colors.black,
          fontSize: 18,
          letterSpacing: 0.2,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0XFFD9D9D9)),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: MediaQuery.of(context).size.width * 0.18,
        height: 55,
        textStyle: GoogleFonts.cairo(
          color: Colors.black,
          fontSize: 18,
          letterSpacing: 0.2,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0XFFA348BB)),
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
