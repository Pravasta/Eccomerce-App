import 'package:ecommerce_app/common/helper/string_helper.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.isWallet,
    required this.iconUrl,
    required this.title,
  });

  final bool isWallet;
  final String iconUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 24,
          ),
          const SizedBox(width: 26),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.textMedium,
            ),
          ),
          isWallet
              ? Text(
                  '(${formatCurrency(9560000.toString())})',
                  style: AppTextStyle.textMedium.copyWith(
                    color: AppColors.greyLightColor,
                  ),
                )
              : const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.lightGrey,
                  size: 24,
                ),
        ],
      ),
    );
  }
}
