import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/module/dashboard/view/dashboard_view.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:ecommerce_app/widgets/button/default_button.dart';
import 'package:flutter/material.dart';

class SuccesCheckout extends StatelessWidget {
  const SuccesCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 33, horizontal: 50),
            child: Column(
              children: [
                Text(
                  'Pesanan Berhasil',
                  style: AppTextStyle.textTripleExtraLarge.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'Selamat! pesananmu berhasil dibuat, cek tombol di bawah untuk mengetahui detail pesananmu',
                  style: AppTextStyle.textLarge.copyWith(
                    color: AppColors.greyLightColor,
                    overflow: TextOverflow.fade,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 27),
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(50),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 3,
                        child: Image.asset(
                          UrlAsset.done2,
                          width: 60,
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 0,
                        child: Image.asset(
                          UrlAsset.done3,
                          width: 60,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          UrlAsset.done1,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                ),
                DefaultButton(
                  text: 'Back Home',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardView(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
