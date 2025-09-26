import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_colors.dart';

AppBar customAppBarWithBackArrow({
  required BuildContext context,
  Widget? title,
  bool centerTitle = true,
  Color leadingIconColor = AppColors.white,
  double elevation = 0,
  Color backgroundColor = AppColors.white,
  bool forceMaterialTransparency = true,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: elevation,
    backgroundColor: backgroundColor,
    forceMaterialTransparency: forceMaterialTransparency,
    title: title,
    centerTitle: centerTitle,
    leadingWidth: 50.w,
    leading: Center(
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).pop();
        },
        child: Container(
          width: 30.w,
          height: 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor.withAlpha(50),
                AppColors.secondaryColor.withAlpha(50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    ),
    actions: actions,
  );
}
