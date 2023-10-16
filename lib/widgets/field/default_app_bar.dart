import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text.dart';

AppBar defaultAppBar({
  required BuildContext context,
  required String title,
  Color backgroundColor = AppColors.whiteColor,
  bool needBack = true,
  void Function()? onPressedBack,
  Color leadingColor = AppColors.blackColor,
  List<Widget>? actions,
}) {
  final title0 = Text(
    title,
    style: AppTextStyle.textDoubleExtraLarge.copyWith(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );

  return AppBar(
    title: title0,
    elevation: 0,
    backgroundColor: backgroundColor,
    automaticallyImplyLeading: false,
    centerTitle: true,
    actions: actions,
    leading: needBack
        ? IconButton(
            onPressed: onPressedBack ?? () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: leadingColor,
              size: 16.0,
            ),
          )
        : null,
  );
}
