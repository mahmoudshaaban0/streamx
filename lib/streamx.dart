import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamx/core/navigation/app_router.dart';
import 'package:streamx/core/theme/app_theme.dart';

class StreamX extends StatelessWidget {
  const StreamX({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'StreamX',
          theme: getApplicationTheme(),
          routerConfig: AppRouter().router),
    );
  }
}
