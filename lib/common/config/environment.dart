enum Environment {
  dev,
  stag,
  prod,
}

class EnvironmentConfigs {
  final String apiUrl;

  const EnvironmentConfigs({
    required this.apiUrl,
  });
}

const Map<Environment, EnvironmentConfigs> _environmentWithConfigsMap = {
  Environment.dev: EnvironmentConfigs(
    apiUrl: 'https://fakestoreapi.com/',
  ),
  Environment.stag: EnvironmentConfigs(
    apiUrl: 'https://fakestoreapi.com/',
  ),
  Environment.prod: EnvironmentConfigs(
    apiUrl: 'https://fakestoreapi.com/',
  ),
};

class EnvironmentUtil {
  static late Environment _currentEnvironment;

  static late EnvironmentConfigs _currentEnvironmentConfigs;

  static void setEnvironment(Environment env) {
    _currentEnvironment = env;
    _currentEnvironmentConfigs = _environmentWithConfigsMap[env]!;
  }

  static Environment getEnvironment() {
    return _currentEnvironment;
  }

  static EnvironmentConfigs getEnvironmentConfigs() {
    return _currentEnvironmentConfigs;
  }
}
