import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';

abstract class CartController {
  List<CartItemModel> get cartItemList;
  int get totalCartItem;

  void addItemToCart(ProductDto product);
  void removeItemFromCart(int productId);
}

class CartItemModel {
  final ProductDto product;
  int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });
}
