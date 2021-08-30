import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/config/environment.dart';
import 'package:flutter_getx_template/common/translations/locale_keys.g.dart';
import 'package:flutter_getx_template/common/widgets/app_button.dart';
import 'package:flutter_getx_template/modules/app_getview/app_getview.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page_controller.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page_controller_impl.dart';
import 'package:get/get.dart';

class SplashPage extends AppGetView<SplashPageController> {
  SplashPage({Key? key})
      : super(
          key: key,
          initialController: SplashPageControllerImpl(
            localizationService: Get.find(),
          ),
        );

  @override
  Widget build(BuildContext context, SplashPageController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Localizations Example
            Text(tr(LocaleKeys.hello, args: ['Willow'])),
            AppButton(
              onPressed: () {
                controller.toggleLanguage();
              },
              child: Text('Switch Language'),
            ),
            SizedBox(height: 10),
            // GetX's Obx Example
            Obx(
              () {
                // Listen to count
                final int count = controller.count;

                return Text(
                  count.toString(),
                );
              },
            ),
            AppButton(
              onPressed: () {
                controller.increaseCount();
              },
              child: Text(
                tr(LocaleKeys.btn_increase),
              ),
            ),
            // Environment
            Text(
              EnvironmentUtil.getEnvironment().toString(),
            ),
          ],
        ),
      ),
    );
  }
}
