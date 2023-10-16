import 'package:ecommerce_app/module/dashboard/view/dashboard_view.dart';
import 'package:ecommerce_app/module/login/view/login_page.dart';
import 'package:ecommerce_app/module/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import 'route_name.dart';

class RouteHandler {
  static String initialRoute = Routes.splash;
  static const initialNavBarVisibility = true;

  static Widget emptyPage() {
    return const Scaffold(
      body: Center(
        child: Text('404 Not Found'),
      ),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }
}
