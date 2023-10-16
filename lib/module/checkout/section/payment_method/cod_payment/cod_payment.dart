import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/module/dashboard/widget/dashboard_button_widget.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:ecommerce_app/widgets/misc/default_divider_widget.dart';
import 'package:flutter/material.dart';

class CodPaymentView extends StatefulWidget {
  const CodPaymentView({super.key});

  @override
  State<CodPaymentView> createState() => _CodPaymentViewState();
}

class _CodPaymentViewState extends State<CodPaymentView> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    textPrimary({required String title, double? size, FontWeight? fontWeight}) {
      return TextSpan(
        text: title,
        style: AppTextStyle.textSmall.copyWith(
            color: AppColors.primaryColor,
            fontSize: size,
            fontWeight: fontWeight ?? FontWeight.w400),
      );
    }

    textLightGrey(
        {required String title, double? size, FontWeight? fontWeight}) {
      return TextSpan(
        text: title,
        style: AppTextStyle.textSmall.copyWith(
            color: AppColors.greyLightColor,
            fontSize: size,
            fontWeight: fontWeight ?? FontWeight.w400),
      );
    }

    Widget tutorialSection() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    UrlAsset.image1,
                  ),
                ),
                const SizedBox(width: 43),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    UrlAsset.image2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        textLightGrey(
                            title: 'Bayar pesanan secara tunai kepada kurir'),
                        textPrimary(title: ' sebelum dibuka.'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 43),
                Flexible(
                  flex: 1,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        textLightGrey(
                            title:
                                'Apabila pesanan tidak sesuai / rusak pembeli dapat mengajukan pengembalian dana/ barang'),
                        textPrimary(title: ' melalui aplikasi Ecommerce'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget skSection() {
      Widget text(int index, String title1,
          {String title2 = '', String title3 = '', String title4 = ''}) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$index. ',
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.greyLightColor,
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    textLightGrey(title: title1),
                    textPrimary(title: title2),
                    textLightGrey(title: title3),
                    textPrimary(title: title4),
                  ],
                ),
              ),
            ),
          ],
        );
      }

      return Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              text(
                1,
                'Pembayaran COD ( Bayar di tempat ) harus langsung',
                title2: ' dilunasi secara tunai kepada kurir',
                title3: ' dan',
                title4: ' tidak dapat dicicil',
              ),
              text(
                2,
                'Pesanan',
                title2: ' tidak dapat dibuka/dicoba',
                title3: ' sebelum pembayaran selesai',
              ),
              text(
                3,
                'Apabila pesanan tidak sesuai/rusak pembeli dapat',
                title2: ' mengembalikan ke kurir',
                title3: ' tetapi dapat mengajukan pengembalian dana/barang',
                title4: ' melalui aplikasi Ecommerce',
              ),
              text(
                4,
                'Berlaku tanpa min. pembelian hingga maks, peembelian Rp. 5.000.000',
              ),
            ],
          ),
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: isCheck,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  isCheck = !isCheck;
                  setState(() {});
                },
              ),
              Expanded(
                child: Text(
                  'Setuju Syarat dan Ketentuan Pembayaran COD',
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
          DashboardButtonWidget(
            title: 'Lanjut',
            onTap: () {
              if (isCheck == true) {
                Navigator.pop(context, isCheck);
              }
            },
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(22),
          child: Column(
            children: [
              Text(
                'Tentang COD',
                style: AppTextStyle.textExtraLarge
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 19),
              Text(
                'CARA MENERIMA & MEMBAYAR PESANAN COD',
                style: AppTextStyle.textExtraLarge.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 18),
              const DefaultDividerWidget(),
              const SizedBox(height: 18),
              tutorialSection(),
              const SizedBox(height: 18),
              const DefaultDividerWidget(),
              const SizedBox(height: 18),
              Text(
                'SYARAT & KETENTUAN PEMBAYARAN COD',
                style: AppTextStyle.textExtraLarge.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 18),
              const DefaultDividerWidget(),
              const SizedBox(height: 18),
              skSection(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
