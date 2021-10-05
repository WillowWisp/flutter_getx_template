import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';

abstract class ProductRepository {
  Future<List<ProductDto>> getProductList();
}
