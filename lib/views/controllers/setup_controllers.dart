import 'package:flutter_getx_template/common/utility/utils/injection_utils.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller_impl.dart';

void setupControllers() {
  registerDep<CartController>(
    CartControllerImpl(),
  );
}
