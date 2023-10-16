import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final ProductService productService;

  late List<Product> _product = [];
  bool isLoading = false;

  List<Product> get product => _product;

  HomeController({
    required this.productService,
  }) {
    fetchDataProduct();
  }

  Future<void> fetchDataProduct() async {
    isLoading = true;
    notifyListeners();

    final fetchDataProduct = await productService.fetchDataProduct();
    _product = fetchDataProduct;
    isLoading = false;
    notifyListeners();
  }
}
