import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/common/config/app_assets.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_template/data/apis/setup_clients.dart';
import 'package:flutter_getx_template/data/repositories/setup_repositories.dart';
import 'package:flutter_getx_template/data/services/setup_services.dart';
import 'package:flutter_getx_template/modules/app_route_observer/app_route_observer.dart';
import 'package:flutter_getx_template/routes/app_pages.dart';

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupRestClient();
  setupRepositories();
  setupServices();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        path: AppAssets.translationsFolder,
        fallbackLocale: Locale('en', 'US'),
        startLocale: Locale('vi', 'VN'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // getPages: AppPages.pages,
      // initialRoute: AppRoutes.splash,
      home: SplashPage(),
      navigatorObservers: [AppRouteObserver()],
      builder: (context, child) {
        final Widget child1 = EasyLoading.init()(context, child);
        final Widget child2 = DevicePreview.appBuilder(context, child1);

        return child2;
      },
    );
  }
}
