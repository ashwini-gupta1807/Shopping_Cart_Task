import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CustomTextTheme {
  CustomTextTheme._();

  // Light Textheme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black.withAlpha(50),
    ),
  );

  // Dark Textheme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white.withAlpha(50),
    ),
  );
}
