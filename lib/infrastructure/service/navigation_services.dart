import 'package:flutter/material.dart';
import 'package:lvit/infrastructure/common/route_constants.dart';
import 'package:lvit/ui/dashborad/dashboard_screen.dart';
import 'package:lvit/ui/splash/splash_screen.dart';

///use this service for provide global context to widgets
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}

/// on generate service
class RouterConstant {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesConstants.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body:
                Center(child: Text('No service defined for ${settings.name}')),
          ),
        );
    }
  }
}

///page transition animations in routing
class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
