import 'package:ecommerce_app/common/constant/dummy_method_payment.dart';
import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/common/helper/string_helper.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/module/checkout/section/checkout_succes.dart';
import 'package:ecommerce_app/module/checkout/section/payment_method/payment_method.dart';
import 'package:ecommerce_app/module/dashboard/widget/dashboard_button_widget.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:ecommerce_app/widgets/button/default_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/misc/default_divider_widget.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
    required this.data,
    required this.countItem,
  });

  final Product data;
  final int countItem;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  DummyPayment? dummyPayment;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget text(String title) {
      return Text(
        title,
        style: AppTextStyle.textLarge.copyWith(
          color: AppColors.greyLightColor,
        ),
        maxLines: 2,
      );
    }

    Widget destinationSection() {
      return Container(
        margin: const EdgeInsets.only(top: 25),
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(253, 245, 243, 0.54),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  UrlAsset.location,
                  width: 25,
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    'Alamat Pengiriman',
                    style: AppTextStyle.textLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DashboardButtonWidget(
                  title: 'Ganti Alamat',
                  onTap: () {},
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 14),
            text('Danilla Puspa | (+62) 877-0651-9987'),
            text(
                'Desa Tanjungsari Dusun Dodokan RT 24/ RW 03, Kec Taman Kab Sidoarjo'),
            text('TAMAN, KAB. SIDOARJO, JAWA TIMUR, ID 61258'),
          ],
        ),
      );
    }

    Widget productSection() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 14),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Image.asset(
              widget.data.imageUrl,
              width: 140,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.data.title,
                    style: AppTextStyle.textDoubleExtraLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 41),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          formatCurrency(widget.data.price.toString()),
                          style: AppTextStyle.textExtraLarge.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        'x${widget.countItem}',
                        style: AppTextStyle.textExtraLarge.copyWith(
                          color: AppColors.lightGrey,
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

    Widget sendSection() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opsi Pengiriman',
              style: AppTextStyle.textExtraLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  UrlAsset.truck,
                  width: 27,
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'REGULER',
                    style: AppTextStyle.textLarge,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Rp. 35.000',
                      style: AppTextStyle.textLarge.copyWith(
                        color: AppColors.greyLightColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.greyLightColor,
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            text('Estimasi diterima pada tanggal 4-7 Jul'),
            const SizedBox(height: 8),
            const DefaultDividerWidget(
              thickness: 0.6,
            ),
          ],
        ),
      );
    }

    Widget paymentSection() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran',
              style: AppTextStyle.textExtraLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const PaymentMethod();
                    },
                  ),
                );

                if (result != null && result is DummyPayment) {
                  setState(() {
                    dummyPayment = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  children: [
                    Image.asset(dummyPayment?.iconUrl ?? UrlAsset.hand,
                        width: 25),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Text(
                        dummyPayment != null
                            ? dummyPayment!.title
                            : 'Pilih Metode Pembayaran',
                        style: AppTextStyle.textExtraLarge.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.greyLightColor,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
            const DefaultDividerWidget(
              thickness: 0.6,
            ),
          ],
        ),
      );
    }

    Widget voucherSection() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            Image.asset(UrlAsset.ticket, width: 25),
            const SizedBox(width: 25),
            Expanded(
              child: Text(
                'Voucher',
                style: AppTextStyle.textExtraLarge.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Text(
              '1 Digunakan',
              style: AppTextStyle.textExtraLarge.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget totalPaymentSection() {
      Widget textPayment(String title, String amount) {
        return Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.textLarge.copyWith(
                  color: AppColors.greyLightColor,
                ),
              ),
            ),
            Text(
              formatCurrency(amount),
              textAlign: TextAlign.right,
              style: AppTextStyle.textLarge.copyWith(
                color: AppColors.greyLightColor,
              ),
            ),
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian Pembayaran',
              style: AppTextStyle.textExtraLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            textPayment(
                'Subtotal Produk', '${widget.data.price * widget.countItem} '),
            const SizedBox(height: 8),
            textPayment('Subtotal Pengiriman', 35000.toString()),
            const SizedBox(height: 8),
            textPayment('Voucher Diskon', 15000.toString()),
            const SizedBox(height: 8),
            textPayment('Biaya Layanan', 5000.toString()),
            const SizedBox(height: 12),
            const DefaultDividerWidget(
              thickness: 0.6,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total',
                    style: AppTextStyle.textDoubleExtraLarge.copyWith(
                      color: AppColors.greyLightColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  formatCurrency(
                      '${(widget.data.price * widget.countItem) + 35000 - 15000 + 5000}'),
                  style: AppTextStyle.textDoubleExtraLarge.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 0.6, color: AppColors.lightGrey),
            const SizedBox(height: 36),
            DefaultButton(
              text: 'Buat Pesanan',
              isLoading: isLoading,
              onPressed: () async {
                isLoading = true;
                setState(() {});
                await Future.delayed(const Duration(seconds: 1)).then(
                  (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccesCheckout(),
                      ),
                      (route) => false),
                );
              },
            ),
            const SizedBox(height: 29),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: ListView(
        children: [
          destinationSection(),
          productSection(),
          sendSection(),
          paymentSection(),
          voucherSection(),
          totalPaymentSection(),
        ],
      ),
    );
  }
}
