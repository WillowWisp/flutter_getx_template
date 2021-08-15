import 'package:get/get.dart';
import 'package:flutter_getx_template/common/utility/utils/injection_utils.dart';
import 'package:flutter_getx_template/data/repositories/todo/todo_repository.dart';
import 'package:flutter_getx_template/data/repositories/todo/todo_repository_impl.dart';

void setupRepositories() {
  registerDep<TodoRepository>(
    TodoRepositoryImpl(
      restClient: Get.find(),
    ),
  );
}
