import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_textstyle.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  const OnBoardingWidget(
      {super.key, this.title = '', this.subTitle = '', this.imageUrl = ''});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(70),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(child: Image.asset(imageUrl))),
          ),
          verticalSpace(48),
          Text(title, style: AppTextStyle.fMulishH5Bold),
          verticalSpace(16),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.fMulishB3Bold
                .copyWith(fontWeight: FontWeight.w500, height: 1.5),
          ),
        ],
      ),
    );
  }
}
