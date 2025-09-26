import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/core/utils/constants/app_colors.dart';
import 'package:shopping_cart/core/widgets/custom_button.dart';

import '../../../core/router/app_router.dart';
import '../shared/providers.dart';

class CheckoutBarWidget extends ConsumerWidget {
  final VoidCallback? onCheckout;
  const CheckoutBarWidget({this.onCheckout, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    if (cart.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '${cart.length} ',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: "${cart.length > 1 ? "Services" : "Service"} added",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              AutoRouter.of(context).push(const CartRoute());
            },
            text: "Check out",
            height: 35.h,
            width: 120.w,
            borderRadius: 10.r,
            textFontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
