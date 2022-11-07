import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/common/config/app_assets.dart';
import 'package:flutter_getx_template/common/routes/app_pages.dart';
import 'package:flutter_getx_template/data_access/apis/setup_clients.dart';
import 'package:flutter_getx_template/data_access/repositories/setup_repositories.dart';
import 'package:flutter_getx_template/data_access/services/localization/localization_service.dart';
import 'package:flutter_getx_template/data_access/services/setup_services.dart';
import 'package:flutter_getx_template/views/controllers/setup_controllers.dart';
import 'package:flutter_getx_template/views/miscs/app_route_observer/app_route_observer.dart';
import 'package:get/get.dart';

late final RouteObserver<PageRoute<dynamic>> appRouteObserver;

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupRestClient();
  setupRepositories();
  setupServices();
  setupControllers();

  appRouteObserver = AppRouteObserver();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => EasyLocalization(
        supportedLocales:
            SupportedLanguage.values.map((lang) => lang.getLocale()).toList(),
        path: AppAssetsTranslation.folder,
        fallbackLocale: SupportedLanguage.en.getLocale(),
        saveLocale: false,
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
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      navigatorObservers: [appRouteObserver],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
        splashFactory: InkSparkle.splashFactory,
      ),
      builder: (context, child) {
        final Widget child1 = EasyLoading.init()(context, child);
        final Widget child2 = DevicePreview.appBuilder(context, child1);

        return child2;
      },
    );
  }
}
