import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/constants/assets.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyle.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  String title;
  String subTitle;
  String imageUrl;

  SearchItemWidget(
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
            child: Image.network(
              "http://image.tmdb.org/t/p/w780/$imageUrl",
              errorBuilder: ((context, error, stackTrace) =>
                  Text(error.toString())),
              fit: BoxFit.cover,
            ),
          ),
        ),
        verticalSpace(8),
        SizedBox(
          width: 150.w,
          child: Text(
            title,
            style: AppTextStyle.fMulishB3Bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        verticalSpace(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.iconsSearchStar),
            horizontalSpace(4),
            Text(
              subTitle,
              style: AppTextStyle.fMulishB5Bold
                  .copyWith(color: const Color(0xff4C4E55)),
            ),
          ],
        ),
      ],
    );
  }
}
