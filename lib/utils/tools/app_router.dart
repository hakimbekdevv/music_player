
import '../../utils/tools/file_importers.dart';

class RouteNames {
  static const splash = '/';
  static const home = '/home';
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
  ],
);