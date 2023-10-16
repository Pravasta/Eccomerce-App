import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/module/dashboard/widget/dashboard_button_widget.dart';
import 'package:ecommerce_app/module/detail_product/section/detail_product_show_modal_bottom.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/widgets/field/default_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../style/text.dart';
import '../section/detail_product_view.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    customBottomNav() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                UrlAsset.chat,
                width: 21,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 4),
              Text(
                'Chat',
                style: AppTextStyle.textSmall.copyWith(
                  color: AppColors.greyLightColor,
                ),
              ),
            ],
          ),
          Container(
            width: 0.5,
            height: 47,
            color: AppColors.lightGrey,
          ),
          Column(
            children: [
              Image.asset(
                UrlAsset.buy,
                width: 21,
              ),
              const SizedBox(height: 4),
              Text(
                'Keranjang',
                style: AppTextStyle.textSmall.copyWith(
                  color: AppColors.greyLightColor,
                ),
              ),
            ],
          ),
          Container(
            width: 0.5,
            height: 47,
            color: AppColors.lightGrey,
          ),
          DashboardButtonWidget(
            title: 'Beli Sekarang',
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return DetailProductModalBottom(data: data);
                },
              );
            },
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: defaultAppBar(
        context: context,
        title: 'Detail Product',
        actions: [
          Image.asset(
            UrlAsset.wishlist,
            width: 21,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: DetailProductView(data: data),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            width: double.infinity,
            color: AppColors.whiteColor,
            child: customBottomNav(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
