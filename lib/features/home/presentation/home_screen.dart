// ...existing code...
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/core/utils/constants/app_colors.dart';
import 'package:shopping_cart/core/utils/constants/app_constants.dart';
import 'package:shopping_cart/core/widgets/custom_button.dart';
import 'package:shopping_cart/features/home/domain/spa_state.dart';
import 'package:shopping_cart/features/home/widgets/checkout_bar_widget.dart';
import 'package:shopping_cart/gen/assets.gen.dart';

import '../../../core/router/app_router.dart';
import '../shared/providers.dart';
import '../widgets/spa_card_widget.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationEnabled = ref.watch(locationProvider);

    return GestureDetector(
      onTap: () {
        AppConstants.hideKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.secondaryColor.withAlpha(120),
                  AppColors.white,
                  AppColors.white,
                  AppColors.white,
                ],
              ),
            ),
            child: () {
              if (locationEnabled == true) {
                final spaState = ref.watch(spaNotifierProvider);

                useEffect(() {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(spaNotifierProvider.notifier).fetchSpas();
                  });
                  return null;
                }, [locationEnabled]);

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.primaryColor,
                                    size: 25.sp,
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
                                    child: Text(
                                      "Madhapur",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                            fontSize: 16.sp,
                                            color: Colors
                                                .white, // Required for ShaderMask to apply gradient
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationStyle:
                                                TextDecorationStyle.dashed,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.spMax),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.white.withAlpha(100),
                              ),
                              child: Icon(
                                Icons.notifications_none,
                                color: AppColors.primaryColor,
                                size: 25.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                          onChanged: (v) =>
                              ref.read(spaSearchQueryProvider.notifier).state =
                                  v,
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: AppColors.white.withAlpha(200),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: AppColors.darkGrey,
                              size: 25.sp,
                            ),
                            hintText: "Search Spa, Services...",
                            hintStyle: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.darkGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        spaState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 200.h),
                              child: CircularProgressIndicator(
                                color: AppColors.secondaryColorDark,
                              ),
                            ),
                          ),
                          loaded: (spas) {
                            final filtered = ref.watch(filteredSpasProvider);
                            if (filtered.isEmpty) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 150.h,
                                  ),
                                  child: Text(
                                    'No spas found',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                ),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final spa = filtered[index];
                                return GestureDetector(
                                  onTap: () {
                                    AutoRouter.of(
                                      context,
                                    ).push(SpaDetailsRoute(spaId: spa.id));
                                  },
                                  child: SpaCardWidget(spa: spa),
                                );
                              },
                            );
                          },
                          error: (msg) => Center(child: Text('Error: $msg')),
                        ),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  ),
                );
              }

              // Center container with single "Enable location" button
              return Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 20.h,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withAlpha(100),
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.animations.locationAnimation.path,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Enable Your Location',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              fontSize: 20.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Please allow to use your location to show\nnearby Saloons on the map.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        onTap: () {
                          ref.read(locationProvider.notifier).enable();
                        },
                        text: 'Enable Location',
                      ),
                    ],
                  ),
                ),
              );
            }(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CheckoutBarWidget(),
      ),
    );
  }
}
