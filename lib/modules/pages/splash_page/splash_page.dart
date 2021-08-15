import 'package:flutter/material.dart';
import 'package:flutter_getx_template/modules/app_getview/app_getview.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page_controller.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page_controller_impl.dart';
import 'package:get/get.dart';

class SplashPage extends AppGetView<SplashPageController> {
  SplashPage({Key? key})
      : super(
          key: key,
          initialController: SplashPageControllerImpl(
            locationService: Get.find(),
          ),
        );

  @override
  Widget build(BuildContext context, SplashPageController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Page'),
      ),
      body: Center(
        child: Obx(
          () {
            // Listen to count
            final int count = controller.count;

            return Text(
              count.toString(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increaseCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
