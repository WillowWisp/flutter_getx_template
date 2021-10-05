import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppLifeCycleController extends GetxController
    with WidgetsBindingObserver {
  AppLifeCycleController();

  @override
  @mustCallSuper
  Future<void> onInit() async {
    WidgetsBinding.instance!.addObserver(this);
    super.onInit();
  }

  @override
  @mustCallSuper
  void onClose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }

  void onAppPause();
  void onAppResume();

  var _lastAppState = AppLifecycleState.resumed; // record Paused, Resume state

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        _lastAppState = state;
        onAppPause();
        break;
      case AppLifecycleState.resumed:
        // to deal with case Resumed => Resumed by notification pull down behavior
        if (state != _lastAppState) {
          onAppResume();
        }
        _lastAppState = state;
        break;
      default:
        break;
    }
  }
}
