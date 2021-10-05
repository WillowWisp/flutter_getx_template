import 'package:flutter_getx_template/common/utility/utils/injection_utils.dart';
import 'package:flutter_getx_template/data_access/repositories/product_repository/product_repository.dart';
import 'package:flutter_getx_template/data_access/repositories/product_repository/product_repository_impl.dart';
import 'package:get/get.dart';

void setupRepositories() {
  registerDep<ProductRepository>(
    ProductRepositoryImpl(
      restClient: Get.find(),
    ),
  );
}
