import 'package:flutter_getx_template/data_access/dtos/todo/todo_dto.dart';

abstract class TodoRepository {
  Future<List<TodoDto>> getTodoList();
}
