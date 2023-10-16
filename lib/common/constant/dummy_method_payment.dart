import 'package:ecommerce_app/common/constant/url_assets.dart';

class DummyPayment {
  final String title;
  final String iconUrl;
  final bool isWallet;
  final int id;

  DummyPayment({
    required this.title,
    required this.iconUrl,
    required this.isWallet,
    required this.id,
  });

  static List<DummyPayment> dataDummy = [
    DummyPayment(
      id: 1,
      iconUrl: UrlAsset.walletOpen,
      isWallet: true,
      title: 'Wallet',
    ),
    DummyPayment(
      id: 2,
      iconUrl: UrlAsset.bank,
      isWallet: false,
      title: 'Transfer Bank',
    ),
    DummyPayment(
      id: 3,
      iconUrl: UrlAsset.creditCard,
      isWallet: false,
      title: 'Kartu Kredit/Debit',
    ),
    DummyPayment(
      id: 4,
      iconUrl: UrlAsset.cod,
      isWallet: false,
      title: 'COD (Bayar di Tempat)',
    )
  ];
}
