import 'package:flutter_getx_template/data/apis/rest_client.dart';
import 'package:flutter_getx_template/data/dtos/todo/todo_dto.dart';
import 'package:flutter_getx_template/data/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final RestClient _restClient;

  TodoRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<TodoDto>> getTodoList() async {
    return await _restClient.getTodoList();
  }
}
