import 'package:flutter/material.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:flutter_getx_template/views/modules/widgets/app_scaffold/app_scaffold.dart';
import 'package:flutter_getx_template/views/widgets/app_button.dart';
import 'package:flutter_getx_template/views/widgets/app_network_image.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final cartItemList = cartController.cartItemList;

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: cartItemList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItemList[index];

                  return _buildCartItem(cartItem);
                },
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Total'),
                  ),
                  Text('\$214.85'),
                ],
              ),
              AppButton(
                child: Text('Checkout'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItemModel cartItem) {
    final product = cartItem.product;

    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: AppNetworkImage(
              imageUrl: product.imageUrl,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartController.removeItemFromCart(product.id);
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(cartItem.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        cartController.addItemToCart(product);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
