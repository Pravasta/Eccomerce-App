import 'package:ecommerce_app/module/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/module/detail_product/controller/detail_product_controller.dart';
import 'package:ecommerce_app/module/home/controller/home_controller.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:provider/provider.dart';

class Injection {
  // static final httpClient = AppHttpClient.create();
  // static final headerProvider = AppHeaderProvider.create();
  // static final endpoint = AppEndpoint.create();

  static final List<ChangeNotifierProvider> providerList = [
    ChangeNotifierProvider<DashboardController>(
      create: (context) => DashboardController(),
    ),
    ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(
        productService: ProductService(),
      ),
    ),
    ChangeNotifierProvider<DetailProductController>(
      create: (context) => DetailProductController(),
    ),
  ];
}
