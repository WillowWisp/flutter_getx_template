import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';
import 'package:flutter_getx_template/data_access/repositories/product_repository/product_repository.dart';
import 'package:flutter_getx_template/views/modules/pages/product_list_page/product_list_page_controller.dart';
import 'package:get/get.dart';

class ProductListPageControllerImpl extends GetxController
    implements ProductListPageController {
  final ProductRepository _productRepository;

  ProductListPageControllerImpl({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  final Rx<bool> _isLoading = Rx(false);
  @override
  bool get isLoading => _isLoading.value;

  final Rx<List<ProductDto>> _productList = Rx([]);
  @override
  List<ProductDto> get productList => _productList.value;

  @override
  void onInit() {
    super.onInit();

    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    _isLoading.value = true;
    _productList.value = await _productRepository.getProductList();
    _isLoading.value = false;
  }
}
