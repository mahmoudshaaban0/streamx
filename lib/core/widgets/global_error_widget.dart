import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/theme/app_textstyle.dart';

import '../constants/assets.dart';

// ignore: must_be_immutable
class GlobalErrorWidget extends StatelessWidget {
  void Function()? onRetry;
  GlobalErrorWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(Assets.iconsErrorIcon),
        verticalSpace(14),
        Text('An error occurred', style: AppTextStyle.fMulishB4Bold),
        verticalSpace(8),
        ElevatedButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: AppTextStyle.fMulishB4Bold,
            ))
      ],
    ));
  }
}
