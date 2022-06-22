import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/views/modules/pages/cart_page/cart_page.dart';
import 'package:flutter_getx_template/views/modules/pages/product_list_page/product_list_page.dart';
import 'package:flutter_getx_template/views/modules/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const productList = '/product-list';
  static const cart = '/cart';

  static final List<_AppPage> _pages = [
    _AppPage(
      name: AppRoutes.splash,
      page: (settings) => SplashPage(),
    ),
    _AppPage(
      name: AppRoutes.productList,
      page: (settings) => ProductListPage(),
    ),
    _AppPage(
      name: AppRoutes.cart,
      page: (settings) => CartPage(),
    ),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final myRouteBuilder = AppRoutes._pages.firstWhereOrNull(
      (page) => page.name == settings.name,
    );
    if (myRouteBuilder != null) {
      return _buildPageRoute(
        child: myRouteBuilder.page(settings),
        settings: settings,
      );
    }

    return _buildPageRoute(
      child: Scaffold(
        body: Center(
          child: Text('No route found: ${settings.name}.'),
        ),
      ),
    );
  }

  static PageRoute<T> _buildPageRoute<T>({
    required Widget child,
    RouteSettings? settings,
  }) {
    return CupertinoPageRoute(
      builder: (context) {
        return child;
      },
      settings: settings,
    );
  }
}

class _AppPage {
  final String name;
  final Widget Function(RouteSettings) page;

  const _AppPage({
    required this.name,
    required this.page,
  });
}
