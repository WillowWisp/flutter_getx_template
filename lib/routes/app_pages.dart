import 'package:get/get.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
  ];
}
