import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_getx_template/data/dtos/todo/todo_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // - Notifications

  @POST('todos')
  Future<List<TodoDto>> getTodoList();

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
