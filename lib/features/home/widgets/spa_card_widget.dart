import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../domain/spa_model.dart';

class SpaCardWidget extends StatelessWidget {
  const SpaCardWidget({super.key, required this.spa});

  final SpaModel spa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        padding: EdgeInsets.all(10.spMax),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withAlpha(50),
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: AssetImage(spa.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            spa.name,
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: AppColors.secondaryColorDark,
                            size: 25.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: AppColors.lightGrey,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              spa.address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        spa.category,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.yellow,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  '${spa.rating}',
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
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
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
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
            SizedBox(height: 10.h),
            spa.offers.isEmpty
                ? SizedBox.shrink()
                : Row(
                    children: [
                      Icon(
                        Icons.local_offer_outlined,
                        color: AppColors.green,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        spa.offers,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.green,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
