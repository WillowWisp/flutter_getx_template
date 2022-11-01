import 'package:dio/dio.dart';
import 'package:flutter_getx_template/common/config/environment.dart';
import 'package:flutter_getx_template/data_access/apis/rest_client.dart';
import 'package:get/get.dart';

final _restClientDio = Dio();

void setupRestClient() {
  Get.put<RestClient>(
    RestClient(
      _restClientDio,
      baseUrl: EnvironmentUtil.getEnvironmentConfigs().apiUrl,
    ),
    permanent: true,
  );
}

void setRestClientBearerToken(String? token) {
  if (token != null) {
    _restClientDio.options.headers["Authorization"] = "Bearer $token";
  } else {
    _restClientDio.options.headers["Authorization"] = null;
  }
}
