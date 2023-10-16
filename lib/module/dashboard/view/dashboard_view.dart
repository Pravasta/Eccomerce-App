import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/module/chat/view/chat_page.dart';
import 'package:ecommerce_app/module/home/view/home_page.dart';
import 'package:ecommerce_app/module/profile/view/profile_page.dart';
import 'package:ecommerce_app/module/wishlist/view/wishlist_page.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/module/dashboard/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();

    Widget customBottomNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: AppColors.whiteColor,
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomBottomNavbar(
                  iconUrl: UrlAsset.home, title: 'Home', index: 0),
              const CustomBottomNavbar(
                  iconUrl: UrlAsset.chat, title: 'Chat', index: 1),
              Image.asset(UrlAsset.scan, width: 45),
              const CustomBottomNavbar(
                  iconUrl: UrlAsset.wishlist, title: 'Wishlist', index: 2),
              const CustomBottomNavbar(
                  iconUrl: UrlAsset.profile, title: 'Profile', index: 3),
            ],
          ),
        ),
      );
    }

    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishListPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          buildContent(controller.currIndex),
          customBottomNavbar(),
        ],
      ),
    );
  }
}
