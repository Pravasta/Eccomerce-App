import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text.dart';

class DashboardButtonWidget extends StatelessWidget {
  const DashboardButtonWidget(
      {super.key, required this.title, required this.onTap, this.height = 45});

  final String title;
  final double? height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: Size(double.infinity, height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.textLarge.copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
