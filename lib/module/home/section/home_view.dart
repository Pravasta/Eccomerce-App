import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/constant/dummy_image.dart';
import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/module/home/section/product_view_section.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:ecommerce_app/widgets/misc/default_divider_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/field/detault_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget banner() {
      return Column(
        children: [
          CarouselSlider(
            items: DummyImage.listBannerImage
                .map(
                  (e) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        e,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.5 / 1,
              viewportFraction: 1,
              initialPage: 0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                currIndex = index;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: DummyImage.listBannerImage.asMap().entries.map((e) {
              return Container(
                width: currIndex == e.key ? 20 : 10,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: currIndex == e.key
                    ? BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      )
                    : BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
              );
            }).toList(),
          ),
        ],
      );
    }

    Widget informationSaldoSection() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Saldo saya',
                    style: AppTextStyle.textSmall.copyWith(
                      color: AppColors.greyLightColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        UrlAsset.walletOpen,
                        width: 21,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Rp 9.560.000',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.textMedium.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 0.5,
              height: 47,
              color: AppColors.lightGrey,
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Voucher saya',
                    style: AppTextStyle.textSmall.copyWith(
                      color: AppColors.greyLightColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        UrlAsset.ticket,
                        width: 21,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '4 Voucher',
                        style: AppTextStyle.textMedium.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget fiturSection() {
      Widget partFitur(String assetsImage, String title) {
        return Column(
          children: [
            Image.asset(
              assetsImage,
              width: 24,
              color: AppColors.primaryColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.greyLightColor,
              ),
            ),
          ],
        );
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: DummyImage.fiturSection
                  .map(
                    (e) => partFitur(
                      e['assetsImage'],
                      e['title'],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            const DefaultDividerWidget(
              thickness: 0.3,
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }

    Widget productSection() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Rekomendasi',
                    style: AppTextStyle.textDoubleExtraLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'See More',
                  style: AppTextStyle.textExtraLarge.copyWith(
                    color: AppColors.greyLightColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 14),
            const ProductViewSection(),
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            const Expanded(
              child: DefaultTextField(hintText: 'Search'),
            ),
            const SizedBox(width: 13),
            Image.asset(
              UrlAsset.buy,
              width: 24,
            ),
            const SizedBox(width: 7),
            Badge(
              smallSize: 8,
              backgroundColor: AppColors.primaryColor,
              child: Image.asset(
                UrlAsset.notification,
                width: 24,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          header(),
          banner(),
          informationSaldoSection(),
          fiturSection(),
          productSection(),
        ],
      ),
    );
  }
}
