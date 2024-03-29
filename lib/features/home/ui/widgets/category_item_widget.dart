import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/helpers/app_functions.dart';

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
            child: CachedNetworkImage(
              memCacheWidth: 120.cacheSize(context),
              memCacheHeight: 80.cacheSize(context),
              imageUrl: "http://image.tmdb.org/t/p/w780/$imageUrl",
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
              child: Text(
                title,
                style: AppTextStyle.fMulishB2Bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(4),
            SizedBox(
              width: 150.w,
              child: Text(
                subTitle,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.fMulishB5Bold
                    .copyWith(color: const Color(0xff4C4E55)),
              ),
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
