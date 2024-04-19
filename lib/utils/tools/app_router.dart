
import 'package:music_player/ui/detail/presentation/detail_screen.dart';

import '../../utils/tools/file_importers.dart';

class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const detail = '/detail';
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
    GoRoute(
      path: RouteNames.detail,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        child: DetailScreen(),
      ),
    ),
  ],
);