import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/features/home/domain/spa_details_state.dart';
import 'package:shopping_cart/features/home/widgets/checkout_bar_widget.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../domain/cart_item_model.dart';
import '../domain/spa_details_model.dart';
import '../shared/providers.dart';

@RoutePage()
class SpaDetailsScreen extends HookConsumerWidget {
  final String spaId;
  const SpaDetailsScreen({super.key, required this.spaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(spaDetailsNotifierProvider);
    final filters = ['All', 'Home-visit', 'Walk-in', 'Male', 'Female'];
    final expandedCategories = useState<Set<String>>({});

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(spaDetailsNotifierProvider.notifier).fetchById(spaId);
      });
      return null;
    }, [spaId]);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.secondaryColorDark,
            ),
          ),
          error: (m) => Center(child: Text(m)),
          loaded: (spa) {
            return Column(
              children: [
                Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                        child: Image.asset(
                          spa.bannerImage,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 10.w,
                        child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 5.w,
                              top: 8.w,
                              bottom: 8.w,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor.withAlpha(80),
                                  AppColors.secondaryColor.withAlpha(80),
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
                      Positioned(
                        bottom: -50.h,
                        left: 15.w,
                        right: 15.w,
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkGrey.withAlpha(80),
                                blurRadius: 2,
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage: AssetImage(spa.image),
                                  ),
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          spa.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.home_outlined,
                                                    color: AppColors.lightGrey,
                                                    size: 20.sp,
                                                  ),
                                                  SizedBox(width: 2.w),
                                                  Text(
                                                    'Madhapur',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: AppColors.lightGrey,
                                                    size: 16.sp,
                                                  ),
                                                  SizedBox(width: 2.w),
                                                  Text(
                                                    '${spa.distanceKm} km',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColors
                                                        .secondaryColor,
                                                    size: 20.sp,
                                                  ),
                                                  SizedBox(width: 2.w),
                                                  Text(
                                                    '${spa.rating}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              spa.offers == null
                                  ? SizedBox.shrink()
                                  : SizedBox(height: 10.h),
                              spa.offers == null
                                  ? SizedBox.shrink()
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,

                                        border: Border.all(
                                          color: AppColors.lightGrey.withAlpha(
                                            20,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.local_offer_outlined,
                                            color: AppColors.green,
                                            size: 25.sp,
                                          ),
                                          SizedBox(width: 5.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: "Use code ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                        fontSize: 13.sp,
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                      ),
                                                  children: [
                                                    TextSpan(
                                                      text: spa.offers['code'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                            fontSize: 12.sp,
                                                            color:
                                                                AppColors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                spa.offers['description'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 10.sp,
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filters.map((f) {
                                final isAll = f == 'All';
                                final isSelected =
                                    isAll; // only "All" is selected
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: GestureDetector(
                                    onTap:
                                        null, // disable all taps so user cannot change selection
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: isSelected
                                              ? [
                                                  AppColors.primaryColor,
                                                  AppColors.secondaryColor,
                                                ]
                                              : [
                                                  AppColors.white,
                                                  AppColors.white,
                                                ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.secondaryColor
                                              : AppColors.primaryColor
                                                    .withAlpha(200),
                                        ),
                                      ),
                                      child: ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                              colors: isSelected
                                                  ? [
                                                      AppColors.white,
                                                      AppColors.white,
                                                    ]
                                                  : [
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
                                        child: Text(
                                          f,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          ...spa.categories.asMap().entries.map((entry) {
                            final index = entry.key;
                            final cat = entry.value;
                            final categoryKey = '${cat.name}_$index';
                            final isExpanded = expandedCategories.value
                                .contains(categoryKey);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Category Header Container
                                GestureDetector(
                                  onTap: () {
                                    final currentSet = Set<String>.from(
                                      expandedCategories.value,
                                    );
                                    if (isExpanded) {
                                      currentSet.remove(categoryKey);
                                    } else {
                                      currentSet.add(categoryKey);
                                    }
                                    expandedCategories.value = currentSet;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 8.h),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: AppColors.lightGrey.withAlpha(
                                          40,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.grey.withAlpha(30),
                                          blurRadius: 2,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cat.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 16.sp,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        AnimatedRotation(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          turns: isExpanded ? 0.5 : 0,
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: isExpanded
                                                ? AppColors.secondaryColor
                                                : AppColors.primaryColor,
                                            size: 24.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Services Below the Container
                                AnimatedCrossFade(
                                  duration: const Duration(milliseconds: 300),
                                  crossFadeState: isExpanded
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  firstChild: const SizedBox.shrink(),
                                  secondChild: Column(
                                    children: [
                                      ...cat.services.asMap().entries.map((
                                        entry,
                                      ) {
                                        final index = entry.key;
                                        final svc = entry.value;
                                        final isLast =
                                            index == cat.services.length - 1;
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 8.h,
                                              ),
                                              child: ServiceTile(
                                                svc: svc,
                                                spaId: spa.id,
                                              ),
                                            ),
                                            if (!isLast)
                                              Divider(
                                                color: AppColors.lightGrey
                                                    .withAlpha(60),
                                                thickness: 1,
                                                height: 20.h,
                                              ),
                                          ],
                                        );
                                      }),
                                      SizedBox(height: 5.h),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                              ],
                            );
                          }),
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CheckoutBarWidget(),
    );
  }
}

class ServiceTile extends ConsumerWidget {
  final ServiceModel svc;
  final String spaId;
  const ServiceTile({required this.svc, required this.spaId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final bool isInCart = cart.any(
      (c) => (c.serviceId == svc.id) && (c.spaId == spaId),
    );

    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      svc.name,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    Text(
                      svc.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 11.5.sp,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  height: 40.h,
                  width: 60.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.grey.withAlpha(120)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 20.sp,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Text(
                      '₹${svc.price}',
                      style: Theme.of(context).textTheme.headlineMedium!
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
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${svc.durationMinutes} Mins',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
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
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      svc.mode,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  text: isInCart ? 'Remove' : 'Add',
                  textColor: isInCart
                      ? AppColors.primaryColor
                      : AppColors.white,
                  fontWeight: FontWeight.w200,
                  borderColor: isInCart
                      ? AppColors.primaryColor.withAlpha(120)
                      : null,
                  gradient: isInCart
                      ? LinearGradient(
                          colors: [AppColors.white, AppColors.white],
                        )
                      : LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.secondaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  onTap: () {
                    if (isInCart) {
                      ref.read(cartProvider.notifier).remove(svc.id, spaId);
                    } else {
                      final item = CartItemModel(
                        serviceId: svc.id,
                        spaId: spaId,
                        name: svc.name,
                        price: svc.price,
                        mode: svc.mode,
                        durationMinutes: svc.durationMinutes,
                      );
                      ref.read(cartProvider.notifier).add(item);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
