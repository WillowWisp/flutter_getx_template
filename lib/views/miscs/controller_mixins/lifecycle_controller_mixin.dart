import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LifecycleControllerMixin on GetxController
    implements WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();

    _addLifecycleObserver();
  }

  @override
  void onClose() {
    super.onClose();

    _removeLifecycleObserver();
  }

  void _addLifecycleObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  void _removeLifecycleObserver() {
    WidgetsBinding.instance.removeObserver(this);
  }

  void onAppPause() {}
  void onAppResume() {}

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        onAppPause();
        break;
      case AppLifecycleState.resumed:
        onAppResume();
        break;
      default:
        break;
    }
  }

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? locales) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}

  @override
  Future<bool> didPopRoute() => Future<bool>.value(false);

  @override
  Future<bool> didPushRoute(String route) => Future<bool>.value(false);

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    return didPushRoute(routeInformation.location!);
  }
}
