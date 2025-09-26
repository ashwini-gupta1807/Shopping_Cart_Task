import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/core/router/app_router.dart';
import 'package:shopping_cart/core/utils/constants/app_colors.dart';
import 'package:shopping_cart/core/widgets/custom_app_bar_with_back_arrow.dart';
import 'package:shopping_cart/core/widgets/custom_button.dart';

import '../shared/providers.dart';

@RoutePage()
class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.read(cartProvider.notifier).totalPrice;
    return Scaffold(
      appBar: customAppBarWithBackArrow(
        context: context,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 16.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Services Order",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.secondaryColor,
                                ],
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              ),
                          child: GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).pop();
                            },
                            child: Text(
                              "Add More",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                if (cart.isEmpty) ...[
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      "Your cart is empty",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ] else ...[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      final isLast = index == cart.length - 1;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "For ${item.mode}",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Text(
                                      '₹${item.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w200,
                                          ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Container(
                                      width: 5.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.primaryColor,
                                            AppColors.secondaryColor,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          50.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      '${item.durationMinutes} Mins',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomButton(
                                  height: 30.h,
                                  borderRadius: 8.r,
                                  gradient: LinearGradient(
                                    colors: [AppColors.white, AppColors.white],
                                  ),
                                  borderColor: AppColors.primaryColor,
                                  textColor: AppColors.primaryColor,
                                  onTap: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .remove(item.serviceId, item.spaId);
                                  },
                                  text: "Remove",
                                ),
                              ),
                            ],
                          ),
                          if (!isLast)
                            Divider(
                              color: AppColors.lightGrey.withAlpha(60),
                              thickness: 1,
                              height: 25.h,
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "Offers & Discounts",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withAlpha(100),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: AppColors.black,
                              size: 25.sp,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Apply Coupon",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.secondaryColor,
                                ],
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Payment Summary",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withAlpha(100),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Selected Services",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
                                SizedBox(width: 4.w),
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      LinearGradient(
                                        colors: [
                                          AppColors.primaryColor,
                                          AppColors.secondaryColor,
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₹$total',
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColors.lightGrey.withAlpha(60),
                          thickness: 1,
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Additional Fee",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              '₹50',
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Additional Fee",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              '₹100',
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColors.lightGrey.withAlpha(60),
                          thickness: 1,
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payable Amount",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              '₹${total + 50 + 100}',
                              style: Theme.of(context).textTheme.headlineLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                ],
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: cart.isEmpty
          ? SizedBox.shrink()
          : Container(
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
                        text: 'Total ',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(
                              fontSize: 15.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                        children: [
                          TextSpan(
                            text: "₹${total + 50 + 100}",
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        useSafeArea: true,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.white,
                            contentPadding: EdgeInsets.zero,
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 100.h,
                            ),
                            content: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 25.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 90.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaryColor,
                                          AppColors.secondaryColor,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 40.sp,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "Your Service Booking is\nConfirmed!",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: 18.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  SizedBox(height: 20.h),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text:
                                          "Thank you for choosing Oasis Spa Haven.\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.lightGrey,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: "Your appointment for ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.lightGrey,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Swedish Massage and\nHot Stone Massage ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.secondaryColor,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              "has been successfully\nbooked.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.lightGrey,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.h,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaryColor.withAlpha(80),
                                          AppColors.secondaryColor.withAlpha(
                                            80,
                                          ),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Text(
                                      "Your appointment on Thursday, 7 Mar 2024\nat 8:00 AM",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontSize: 13.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 25.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    child: CustomButton(
                                      onTap: () {
                                        AutoRouter.of(context).pushAndPopUntil(
                                          HomeRoute(),
                                          predicate: (route) => false,
                                        );
                                      },
                                      text: 'Done',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    text: "Pay",
                    height: 35.h,
                    width: 120.w,
                    borderRadius: 10.r,
                    textFontSize: 14.sp,
                  ),
                ],
              ),
            ),
    );
  }
}
