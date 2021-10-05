import 'package:dio/dio.dart';
import 'package:flutter_getx_template/common/config/environment.dart';
import 'package:flutter_getx_template/data_access/apis/rest_client.dart';
import 'package:get/get.dart';

void setupRestClient() {
  final dio = Dio();
  dio.options = BaseOptions(
    headers: <String, dynamic>{
      // 'ApiKey': EnvironmentUtil.getEnvironmentConfigs().apiKey,
    },
  );

  // if ([null, ''].contains(bearerAuthToken) == false) {
  //   dio.options.headers["Authorization"] = "Bearer $bearerAuthToken";
  // }

  Get.put<RestClient>(
    RestClient(
      dio,
      baseUrl: EnvironmentUtil.getEnvironmentConfigs().apiUrl,
    ),
    permanent: true,
  );
}
