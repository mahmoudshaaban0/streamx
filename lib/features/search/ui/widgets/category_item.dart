import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyle.dart';

class SearchCategoryItem extends StatefulWidget {
  final String title;
  const SearchCategoryItem({super.key, required this.title});

  @override
  State<SearchCategoryItem> createState() => _SearchCategoryItemState();
}

class _SearchCategoryItemState extends State<SearchCategoryItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Container(
          height: 32.h,
          width: 70.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: isSelected
                  ? AppTextStyle.fMulishB4Bold.copyWith(color: Colors.white)
                  : AppTextStyle.fMulishB4Bold,
            ),
          ),
        ),
      ),
    );
  }
}
