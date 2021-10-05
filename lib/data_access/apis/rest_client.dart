import 'package:dio/dio.dart';
import 'package:flutter_getx_template/data_access/dtos/product/product_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // - Notifications

  @GET('products')
  Future<List<ProductDto>> getProductList();

  @GET('products/{id}')
  Future<ProductDto> getProduct(
    @Path('id') String id,
  );

// * Example

// @GET('stock/search/company/{fragment}')
// Future<List<CompanySummaryDto>> searchCompanies(
//   @Path('fragment') String fragment, {
//   @Query('limit') int limit = 10,
// });

// @POST('stock/quote')
// Future<Map<String, StockQuoteDto>> getQuotes(
//   @Body() GetQuotesRequestDto request,
// );
}
