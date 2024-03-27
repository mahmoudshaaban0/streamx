import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyle.dart';

// ignore: must_be_immutable
class HeadLineWidget extends StatelessWidget {
  String title;
  String showAll;
  HeadLineWidget({super.key, required this.title, required this.showAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.fMulishB2Bold,
        ),
        const Spacer(),
        Text(showAll,
            style: AppTextStyle.fMulishB3Bold
                .copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
