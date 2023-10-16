import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:flutter/material.dart';

import '../misc/default_circluar_progress_indicator.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isBlockSize = true,
    this.outlined = false,
    this.isFullWidth = false,
    this.trailingIcon,
    this.needBorderSide = true,
  }) : super(key: key);

  final String text;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isBlockSize;
  final bool outlined;
  final bool isFullWidth;
  final Widget? trailingIcon;
  final bool needBorderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: (outlined) ? AppColors.primaryColor : Colors.white,
        fixedSize: (isBlockSize)
            ? Size(
                MediaQuery.of(context).size.width - (isFullWidth ? 0 : 48),
                50.0,
              )
            : null,
        minimumSize: const Size(double.infinity, 40),
        backgroundColor: (outlined) ? Colors.white : AppColors.primaryColor,
        side: needBorderSide
            ? const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              )
            : const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
      ),
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      child: (!isLoading)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                trailingIcon ?? const SizedBox(),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textLarge.copyWith(
                    color: (outlined) ? AppColors.primaryColor : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          : DefaultCircularProgress(
              color: (outlined) ? AppColors.primaryColor : Colors.white,
            ),
    );
  }
}
