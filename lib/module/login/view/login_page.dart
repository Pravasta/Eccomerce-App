import 'package:ecommerce_app/module/login/section/login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginPage(),
      settings: const RouteSettings(name: 'login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}
