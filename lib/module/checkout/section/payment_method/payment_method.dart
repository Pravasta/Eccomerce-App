import 'package:ecommerce_app/common/constant/dummy_method_payment.dart';
import 'package:ecommerce_app/module/checkout/section/payment_method/cod_payment/cod_payment.dart';
import 'package:ecommerce_app/module/checkout/widget/payment_method_widget.dart';
import 'package:ecommerce_app/widgets/field/default_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/misc/default_divider_widget.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DummyPayment.dataDummy;

    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Metode Pembayaran',
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 43, horizontal: 13),
        width: double.infinity,
        child: Column(
          children: data
              .map(
                (dummyPayment) => Column(
                  children: [
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        if (dummyPayment.id == 4) {
                          final navigator = Navigator.of(context);

                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => const CodPaymentView(),
                            ),
                          )
                              .then((value) {
                            if (value == true) {
                              navigator.pop(dummyPayment);
                            }
                          });
                        } else {
                          Navigator.pop(context, dummyPayment);
                        }
                      },
                      child: PaymentMethodWidget(
                        isWallet: dummyPayment.isWallet,
                        iconUrl: dummyPayment.iconUrl,
                        title: dummyPayment.title,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const DefaultDividerWidget(thickness: 0.6),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
