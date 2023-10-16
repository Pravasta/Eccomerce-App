import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/module/checkout/section/checkout_view.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/widgets/field/default_app_bar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.countItem,
    required this.data,
  });

  final int countItem;
  final Product data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: defaultAppBar(
        context: context,
        title: 'Checkout',
      ),
      body: CheckoutView(
        data: data,
        countItem: countItem,
      ),
    );
  }
}
