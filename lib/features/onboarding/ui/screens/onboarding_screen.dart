import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/navigation/app_routes.dart';
import 'package:streamx/core/theme/app_colors.dart';
import 'package:streamx/core/theme/app_textstyle.dart';
import 'package:streamx/features/onboarding/data/boarding_data.dart';
import 'package:streamx/features/onboarding/ui/widgets/dot_indicator_widget.dart';
import 'package:streamx/features/onboarding/ui/widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: onBoardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnBoardingWidget(
                        title: onBoardingData[index].title,
                        subTitle: onBoardingData[index].subTitle,
                        imageUrl: onBoardingData[index].imageUrl,
                      );
                    }),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(327.w, 52.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (_pageIndex == onBoardingData.length - 1) {
                      context.pushNamed(AppRoutes.bottomNavBarRoute);
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }
                  },
                  child: Text(
                    'Continue',
                    style: AppTextStyle.fMulishB3Bold
                        .copyWith(color: Colors.white),
                  )),
              verticalSpace(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      onBoardingData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DotIndicatorWidget(
                              isActive: index == _pageIndex,
                            ),
                          ))
                ],
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
