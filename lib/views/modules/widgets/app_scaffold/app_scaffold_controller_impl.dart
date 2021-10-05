import 'package:flutter_getx_template/common/routes/app_pages.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:flutter_getx_template/views/modules/widgets/app_scaffold/app_scaffold_controller.dart';
import 'package:get/get.dart';

class AppScaffoldControllerImpl implements AppScaffoldController {
  final CartController _cartController;

  AppScaffoldControllerImpl({
    required CartController cartController,
  }) : _cartController = cartController;

  @override
  void goToCart() {
    final bool isCartEmpty = _cartController.cartItemList.isEmpty;
    if (isCartEmpty) {
      Get.snackbar(
        'Your cart is empty',
        'Please add some product first',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.toNamed(AppRoutes.cart);
  }
}
