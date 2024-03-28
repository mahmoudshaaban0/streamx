import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:streamx/features/home/ui/screens/home_screen.dart';
import 'package:streamx/features/search/ui/screens/search_screen.dart';

import '../constants/assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const HomeScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(Assets.iconsBottomNavHomeActive),
              inactiveIcon: SvgPicture.asset(Assets.iconsBottomNavHomeInactive),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: SearchScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(Assets.iconsBottomNavSearchActive),
              inactiveIcon:
                  SvgPicture.asset(Assets.iconsBottomNavSearchInactive),
              title: "Search",
            ),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: SvgPicture.asset(Assets.iconsBottomNavProfileActive),
              inactiveIcon:
                  SvgPicture.asset(Assets.iconsBottomNavProfileInactive),
              title: "Settings",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
