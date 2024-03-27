import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyle.dart';

// ignore: must_be_immutable
class MovieItemWidget extends StatelessWidget {
  String title;
  String subTitle;
  String imageUrl;

  MovieItemWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 180.h,
            width: 120.w,
            color: AppColors.primaryColor,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        verticalSpace(8),
        Text(
          title,
          style: AppTextStyle.fMulishB3Bold,
        ),
        verticalSpace(4),
        Text(
          subTitle,
          style: AppTextStyle.fMulishB5Bold
              .copyWith(color: const Color(0xff4C4E55)),
        ),
      ],
    );
  }
}
