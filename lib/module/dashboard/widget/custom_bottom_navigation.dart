import 'package:ecommerce_app/module/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.index,
  });

  final String title;
  final String iconUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();

    return InkWell(
      onTap: () {
        controller.setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            iconUrl,
            width: 27,
            color: controller.currIndex == index
                ? AppColors.primaryColor
                : AppColors.greyLightColor,
          ),
          Text(
            title,
            style: AppTextStyle.textSmall.copyWith(
              color: controller.currIndex == index
                  ? AppColors.primaryColor
                  : AppColors.greyLightColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
