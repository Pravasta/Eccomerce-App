import 'package:ecommerce_app/common/constant/url_assets.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter/services.dart';

class ProductService {
  Future<List<Product>> fetchDataProduct() async {
    try {
      final response = await rootBundle.loadString(UrlAsset.data);

      return productFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
