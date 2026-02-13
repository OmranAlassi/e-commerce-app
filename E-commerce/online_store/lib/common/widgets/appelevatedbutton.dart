import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppElevatedbutton extends StatelessWidget {
  AppElevatedbutton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
  });
  void Function()? onPressed;
  String title;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        fixedSize: Size(MediaQuery.of(context).size.width * 0.99, 42),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(title, style: GoogleFonts.lato(color: Color(0xFFFFFFFF))),
    );
  }
}
