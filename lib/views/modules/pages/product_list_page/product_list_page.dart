import 'package:flutter/material.dart';
import 'package:flutter_getx_template/views/miscs/app_getview/app_getview.dart';
import 'package:flutter_getx_template/views/modules/pages/product_list_page/product_list_page_controller.dart';
import 'package:flutter_getx_template/views/modules/pages/product_list_page/product_list_page_controller_impl.dart';
import 'package:flutter_getx_template/views/modules/widgets/app_scaffold/app_scaffold.dart';
import 'package:flutter_getx_template/views/widgets/product_grid_view.dart';
import 'package:get/get.dart';

class ProductListPage extends AppGetView<ProductListPageController> {
  ProductListPage({Key? key})
      : super(
          key: key,
          controllerRegister: (_) => ProductListPageControllerImpl(
            productRepository: Get.find(),
          ),
        );

  @override
  Widget build(BuildContext context, ProductListPageController controller) {
    return AppScaffold(
      body: Obx(() {
        final isLoading = controller.isLoading;
        final productList = controller.productList;

        if (isLoading) {
          return Text('Loading...');
        }

        return ProductGridView(productList: productList);
      }),
    );
  }
}
