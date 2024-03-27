import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_textstyle.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String subTitle;
  CategoryItemWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 80.h,
            width: 120.w,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.fMulishB2Bold,
            ),
            verticalSpace(4),
            Text(
              subTitle,
              style: AppTextStyle.fMulishB5Bold
                  .copyWith(color: const Color(0xff4C4E55)),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.iconsVideoPlay,
          width: 25.w,
          height: 25.h,
        )
      ],
    );
  }
}
