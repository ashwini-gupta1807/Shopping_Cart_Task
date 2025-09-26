// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rhythmiq/core/utils/constants/app_constants.dart';

// import '../constants/app_colors.dart';

// Future<dynamic> customAlertDialogBox({
//   required BuildContext context,
//   required String bodyText,
//   required VoidCallback tapLeftButton,
//   required VoidCallback tapRightButton,
//   required String leftButtonText,
//   required String rightButtonText,
//   required double height,
//   bool? isHeadText = false,
//   String? headText,
// }) {
//   final isDarkMode = AppConstants.isDarkMode(context: context);
//   return showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) {
//       return AlertDialog(
//         contentPadding: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         content: Container(
//           height: height,
//           width: 1.sw,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: isDarkMode
//                 ? AppColors.darkGrey.withOpacity(0.6)
//                 : Colors.white,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   isHeadText == true
//                       ? Padding(
//                           padding: EdgeInsets.only(
//                             left: 15.w,
//                             right: 15.w,
//                             top: 15.h,
//                           ),
//                           child: Text(
//                             headText!,
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).textTheme.headlineLarge!
//                                 .copyWith(
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                           ),
//                         )
//                       : const SizedBox.shrink(),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 15.w,
//                       right: 15.w,
//                       top: 15.h,
//                       bottom: 10.h,
//                     ),
//                     child: Text(
//                       bodyText,
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context).textTheme.headlineLarge!
//                           .copyWith(
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Divider(thickness: 1.w, height: 0.h),
//               Expanded(
//                 flex: 3,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: tapLeftButton,
//                         child: Text(
//                           leftButtonText,
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.displayLarge!
//                               .copyWith(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 1.sh,
//                       width: 1.w,
//                       color: const Color.fromARGB(255, 123, 123, 123),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: tapRightButton,
//                         child: Text(
//                           rightButtonText,
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.displayLarge!
//                               .copyWith(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
