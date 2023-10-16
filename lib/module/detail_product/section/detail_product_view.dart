import 'package:ecommerce_app/common/constant/dummy_text.dart';
import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/common/helper/string_helper.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/module/dashboard/widget/dashboard_button_widget.dart';
import 'package:ecommerce_app/module/detail_product/widget/detail_product_review_widget.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:ecommerce_app/widgets/misc/default_divider_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class DetailProductView extends StatelessWidget {
  const DetailProductView({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    productImage() {
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          data.imageUrl,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget dataProduct() {
      Widget productRelate() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              UrlAsset.relate1,
              width: 100,
            ),
            Image.asset(
              UrlAsset.relate2,
              width: 100,
            ),
            Image.asset(
              UrlAsset.relate3,
              width: 100,
            ),
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    formatCurrency(data.price.toString()),
                    style: AppTextStyle.textDoubleExtraLarge.copyWith(
                      fontSize: 29,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.orange,
                ),
                Text(
                  ' ${data.rating}/5 | ${formatNumber(double.parse(data.selling.toString()))} Terjual',
                  maxLines: 1,
                  style: AppTextStyle.textExtraLarge.copyWith(
                    color: AppColors.lightGrey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              data.title,
              style: AppTextStyle.textExtraLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ExpandableText(
              DummyText.textLorem,
              expandText: 'Selengkapnya',
              maxLines: 3,
              collapseText: 'tutup',
              style: AppTextStyle.textLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.lightGrey,
              ),
              linkColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 16),
            productRelate(),
          ],
        ),
      );
    }

    Widget shopName() {
      return Column(
        children: [
          const DefaultDividerWidget(
            thickness: 0.6,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset(
                UrlAsset.shop,
                width: 50,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Maxim Store',
                      style: AppTextStyle.textExtraLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '12 Ribu Pengikut',
                      style: AppTextStyle.textLarge
                          .copyWith(color: AppColors.lightGrey),
                    )
                  ],
                ),
              ),
              DashboardButtonWidget(
                title: 'Ikuti',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const DefaultDividerWidget(
            thickness: 0.6,
          ),
        ],
      );
    }

    userComment() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ulasan',
              style: AppTextStyle.textDoubleExtraLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const DetailProductReviewWidget(
              name: 'Ayu Widiawati',
              review: 'Overall bagus banget sihh',
              imageUrl: UrlAsset.user1,
              initialRating: 5,
            ),
            const DetailProductReviewWidget(
              name: 'Hanungrium',
              review: 'Pengiriman cepat, barang original.',
              imageUrl: UrlAsset.user2,
              initialRating: 4.5,
            ),
            const SizedBox(height: 50),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: ListView(
        children: [
          productImage(),
          dataProduct(),
          shopName(),
          userComment(),
        ],
      ),
    );
  }
}
