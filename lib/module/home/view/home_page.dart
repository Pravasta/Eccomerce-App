import 'package:ecommerce_app/style/colors.dart';
import 'package:flutter/material.dart';

import '../section/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: HomeView(),
    );
  }
}
