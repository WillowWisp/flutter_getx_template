import 'package:flutter_getx_template/views/modules/pages/cart_page/cart_page.dart';
import 'package:flutter_getx_template/views/modules/pages/product_list_page/product_list_page.dart';
import 'package:flutter_getx_template/views/modules/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.productList,
      page: () => ProductListPage(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
    ),
  ];
}
