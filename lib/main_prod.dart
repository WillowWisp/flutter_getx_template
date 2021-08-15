import 'package:flutter_getx_template/common/config/environment.dart';
import 'package:flutter_getx_template/main.dart';

void main() {
  EnvironmentUtil.setEnvironment(Environment.prod);
  mainDelegate();
}
