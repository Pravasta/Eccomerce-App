import 'dart:async';

import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/module/login/view/login_page.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushAndRemoveUntil(LoginPage.route(), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              UrlAsset.logo,
            ),
          ),
        ),
      ),
    );
  }
}
