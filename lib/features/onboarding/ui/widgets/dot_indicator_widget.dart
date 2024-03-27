import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  final bool isActive;
  const DotIndicatorWidget({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: isActive ? 18 : 9,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
