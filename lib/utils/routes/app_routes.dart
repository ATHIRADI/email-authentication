import 'package:flutter/material.dart';
import 'package:version2/pages/pages.dart';

import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case RouteNames.onboarding:
        page = const OnboardingScreen();
        break;
      case RouteNames.login:
        page = const LoginScreen();
        break;
      case RouteNames.signUp:
        page = const SignUpScreen();
        break;
      case RouteNames.forgotPassword:
        page = const ForgotPasswordScreen();
        break;
      case RouteNames.home:
        page = const HomeScreen();
        break;
      default:
        page = const Scaffold(
          body: Center(child: Text('404: Page not found')),
        );
    }

    return _createPageTransition(page);
  }

  static Route _createPageTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
