import 'package:flutter/material.dart';
import 'package:pixwalls/presentation/screens/landing_screen.dart';
import 'package:pixwalls/presentation/screens/splash_screen.dart';

class Routes {
  static Route? onGeneratedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (context) => LandingScreen());
      case "/splash":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return null;
    }
  }
}
