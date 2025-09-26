import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderColor,
    this.textColor,
    this.textFontSize,
    this.gradient,
    this.height,
    this.width,
    this.borderRadius,
    this.fontWeight,
  });
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final String text;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? textColor;
  final double? textFontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 1.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient:
              gradient ??
              LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.primaryColor, AppColors.secondaryColor],
              ),
          borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: textColor ?? AppColors.white,
            fontSize: textFontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
