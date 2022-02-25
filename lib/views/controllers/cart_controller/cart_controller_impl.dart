import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:get/get.dart';

class CartControllerImpl extends GetxController implements CartController {
  CartControllerImpl();

  final Rx<List<CartItemModel>> _cartItemList = Rx([]);
  @override
  List<CartItemModel> get cartItemList => _cartItemList.value;

  @override
  int get totalCartItem => _cartItemList.value
      .fold<int>(0, (value, cartItem) => value + cartItem.quantity);

  @override
  void addItemToCart(ProductDto product) {
    final foundCartItem = cartItemList
        .firstWhereOrNull((cartItem) => cartItem.product.id == product.id);

    if (foundCartItem == null) {
      cartItemList.add(
        CartItemModel(
          product: product,
          quantity: 1,
        ),
      );
    } else {
      // Mutate
      foundCartItem.quantity++;
    }

    _cartItemList.refresh();
  }

  @override
  void removeItemFromCart(int productId) {
    final foundCartItem = cartItemList
        .firstWhereOrNull((cartItem) => cartItem.product.id == productId);

    if (foundCartItem == null) {
      return;
    }

    // Mutate
    foundCartItem.quantity--;

    if (foundCartItem.quantity <= 0) {
      cartItemList.remove(foundCartItem);
    }

    _cartItemList.refresh();
  }

  @override
  int getProductQuantity(int productId) {
    final foundCartItem = cartItemList
        .firstWhereOrNull((cartItem) => cartItem.product.id == productId);

    if (foundCartItem == null) {
      return 0;
    }

    return foundCartItem.quantity;
  }
}
