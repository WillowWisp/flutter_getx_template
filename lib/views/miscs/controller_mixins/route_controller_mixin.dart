import 'package:flutter/material.dart';
import 'package:flutter_getx_template/main.dart';
import 'package:get/get.dart';

mixin RouteControllerMixin on GetxController implements RouteAware {
  @override
  void onInit() {
    super.onInit();

    _addRouteObserver();
  }

  @override
  void onClose() {
    super.onClose();

    _removeRouteObserver();
  }

  BuildContext getContext();

  void _addRouteObserver() {
    final modalRoute = ModalRoute.of(getContext());
    if (modalRoute is PageRoute) {
      appRouteObserver.subscribe(this, modalRoute);
    }
  }

  void _removeRouteObserver() {
    appRouteObserver.unsubscribe(this);
  }

  @override
  void didPushNext() {}
  @override
  void didPopNext() {}

  @override
  void didPop() {}
  @override
  void didPush() {}
}
