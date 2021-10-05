import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:flutter_getx_template/views/widgets/app_network_image.dart';
import 'package:get/get.dart';

const double _actionSize = 30;

class ProductGridView extends StatelessWidget {
  final List<ProductDto> productList;

  ProductGridView({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.5,
          crossAxisSpacing: 1.5,
          childAspectRatio: 3 / 4,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return _buildProductItem(product);
        },
      ),
    );
  }

  Widget _buildProductItem(ProductDto product) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: AppNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.only(
                  left: 5,
                  right: _actionSize + 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      product.title,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Obx(() {
              final quantity = cartController.getProductQuantity(product.id);
              final bool hasInCart = quantity > 0;

              return Column(
                children: [
                  if (hasInCart) ...[
                    _buildSquare(
                      onPressed: () {
                        cartController.removeItemFromCart(product.id);
                      },
                      isFirstItem: true,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    _buildSquare(
                      isFirstItem: false,
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  _buildSquare(
                    onPressed: () {
                      cartController.addItemToCart(product);
                    },
                    isFirstItem: !hasInCart,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSquare({
    void Function()? onPressed,
    required bool isFirstItem,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: _actionSize,
        height: _actionSize,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.only(
            topLeft: isFirstItem ? Radius.circular(15) : Radius.zero,
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
