import 'package:get/get.dart';

void registerDep<T>(T dependency) {
  Get.put<T>(dependency, permanent: true);
}
