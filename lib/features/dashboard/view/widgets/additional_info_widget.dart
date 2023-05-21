import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';

class AdditionInfoWidgets extends StatelessWidget {
  const AdditionInfoWidgets({
    required this.icon,
    required this.data,
    required this.title,
    super.key,
  });
  final String icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/$icon.png",
          width: 35,
          height: 35,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          data,
          style: GoogleFonts.nunitoSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: GoogleFonts.nunitoSans(
              fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.grey),
        ),
      ],
    );
  }
}
