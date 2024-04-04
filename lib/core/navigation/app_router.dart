import 'package:go_router/go_router.dart';
import 'package:streamx/core/navigation/app_routes.dart';
import 'package:streamx/core/widgets/custom_bottom_nav_bar.dart';
import 'package:streamx/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:streamx/features/search/data/search_request_response.dart';
import 'package:streamx/features/search/ui/screens/search_details_screen.dart';

const String onBoardingPath = '/';
const String bottomNavBarPath = '/bottomNavBar';
const String searchDetailsScreenPath = '/searchDetailsScreen';

class AppRouter {
  GoRouter router =
      GoRouter(initialLocation: AppRoutes.onBoardingRoute, routes: [
    GoRoute(
      name: AppRoutes.onBoardingRoute,
      path: onBoardingPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnBoardingScreen()),
    ),
    GoRoute(
      name: AppRoutes.bottomNavBarRoute,
      path: bottomNavBarPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: CustomBottomNavBar()),
    ),
    GoRoute(
      name: AppRoutes.searchDetailsScreen,
      path: searchDetailsScreenPath,
      pageBuilder: (context, state) => NoTransitionPage(
          child: SearchDetailsScreen(
        searchResponse: state.extra as Result,
      )),
    ),
  ]);
}
