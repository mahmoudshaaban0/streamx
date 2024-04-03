import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/theme/app_textstyle.dart';

import '../constants/assets.dart';

// ignore: must_be_immutable
class GlobalErrorWidget extends StatelessWidget {
  void Function()? onRetry;
  final String text;
  GlobalErrorWidget({super.key, this.onRetry, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(Assets.iconsErrorIcon),
        verticalSpace(14),
        Text(
          text,
          style: AppTextStyle.fMulishB4Bold,
          textAlign: TextAlign.center,
        ),
        verticalSpace(8),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(100.w, 40.h),
            ),
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: AppTextStyle.fMulishB4Bold.copyWith(color: Colors.white),
            ))
      ],
    ));
  }
}
