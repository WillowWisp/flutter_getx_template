import 'package:get/get.dart';
import 'package:flutter_getx_template/data/services/location/location_service.dart';
import 'package:flutter_getx_template/modules/pages/splash_page/splash_page_controller.dart';

class SplashPageControllerImpl extends GetxController
    implements SplashPageController {
  final LocationService _locationService;

  SplashPageControllerImpl({
    required LocationService locationService,
  }) : _locationService = locationService;

  final Rx<int> _count = Rx(0);
  @override
  int get count => _count.value;

  @override
  Future<void> onInit() async {
    super.onInit();

    print('onInit Splash');
    _locationService.getPosition();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    print('onReady Splash');
  }

  @override
  Future<void> onClose() async {
    print('onClose Splash');

    super.onClose();
  }

  @override
  void increaseCount() {
    _count.value++;
  }
}
