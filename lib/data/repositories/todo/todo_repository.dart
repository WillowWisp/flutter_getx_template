import 'package:flutter_getx_template/data/dtos/todo/todo_dto.dart';

abstract class TodoRepository {
  Future<List<TodoDto>> getTodoList();
}
