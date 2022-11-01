import 'package:flutter/material.dart';
import 'package:flutter_getx_template/views/controllers/cart_controller/cart_controller.dart';
import 'package:flutter_getx_template/views/miscs/app_getview/app_getview.dart';
import 'package:flutter_getx_template/views/widgets/common/app_scaffold/app_scaffold_controller.dart';
import 'package:flutter_getx_template/views/widgets/common/app_scaffold/app_scaffold_controller_impl.dart';
import 'package:get/get.dart';

class AppScaffold extends AppGetView<AppScaffoldController> {
  final Widget body;

  AppScaffold({
    Key? key,
    required this.body,
  }) : super(
          key: key,
          controllerRegister: (_) => AppScaffoldControllerImpl(
            cartController: Get.find(),
          ),
        );

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context, AppScaffoldController controller) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Leblanc',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[850],
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  controller.goToCart();
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Obx(() {
                final totalCartItem = cartController.totalCartItem;

                if (totalCartItem <= 0) {
                  return SizedBox();
                }

                return Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        totalCartItem.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      body: body,
    );
  }
}
