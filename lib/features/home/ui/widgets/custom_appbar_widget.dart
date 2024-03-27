import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_textstyle.dart';

class CucstomAppBarWidget extends StatelessWidget {
  const CucstomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset(Assets.imagesFrame),
        ),
        horizontalSpace(8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hi, Mahmoud Shaaban',
              style: AppTextStyle.fMulishB3Bold,
            ),
            Text(
              'Let\'s watch a movie',
              style: AppTextStyle.fMulishB3Bold
                  .copyWith(color: const Color(0xff8C8E98)),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              Assets.iconsSearchHome,
              width: 25.w,
              height: 25.h,
            ),
            horizontalSpace(16),
            SvgPicture.asset(Assets.iconsNotificationHome,
                width: 25.w, height: 25.h),
          ],
        ),
      ],
    );
  }
}
