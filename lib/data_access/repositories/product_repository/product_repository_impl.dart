import 'package:flutter_getx_template/data_access/apis/rest_client.dart';
import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';
import 'package:flutter_getx_template/data_access/repositories/product_repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductDto>> getProductList() async {
    return await _restClient.getProductList();
  }
}
