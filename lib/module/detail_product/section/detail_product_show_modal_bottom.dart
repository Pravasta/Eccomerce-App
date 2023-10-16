import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/module/checkout/view/checkout_page.dart';
import 'package:ecommerce_app/module/detail_product/controller/detail_product_controller.dart';
import 'package:ecommerce_app/widgets/button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/helper/string_helper.dart';
import '../../../style/colors.dart';
import '../../../style/text.dart';

class DetailProductModalBottom extends StatelessWidget {
  const DetailProductModalBottom({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DetailProductController>();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1 / 2,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  data.imageUrl,
                  width: 170,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            formatCurrency(data.price.toString()),
                            style: AppTextStyle.textDoubleExtraLarge.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.itemCoo = 1;
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: AppColors.greyLightColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Stok: 60',
                      style: AppTextStyle.textDoubleExtraLarge.copyWith(
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.6, color: AppColors.lightGrey),
                bottom: BorderSide(width: 0.6, color: AppColors.lightGrey),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Jumlah',
                    style: AppTextStyle.textExtraLarge,
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller.itemCo <= 1) {
                            Navigator.of(context).pop();
                          } else {
                            controller.deleteItem();
                          }
                        },
                        child: Image.asset(UrlAsset.arrowLeft, width: 27),
                      ),
                      Text(
                        '${controller.itemCo}',
                        style: AppTextStyle.textExtraLarge.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.addItem();
                        },
                        child: Image.asset(UrlAsset.arrowRight, width: 27),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          DefaultButton(
            text: 'Beli Sekarang',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CheckoutPage(
                  countItem: controller.itemCo,
                  data: data,
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
