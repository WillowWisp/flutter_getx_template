import 'package:flutter_getx_template/common/utility/utils/injection_utils.dart';
import 'package:flutter_getx_template/data/services/localization/localization_service.dart';
import 'package:flutter_getx_template/data/services/localization/localization_service_impl.dart';

void setupServices() {
  registerDep<LocalizationService>(
    LocalizationServiceImpl(),
  );
}
