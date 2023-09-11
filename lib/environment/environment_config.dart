class EnvironmentConfig {
  static const ENV_NAME = String.fromEnvironment(
      'ENV_NAME',
      defaultValue: 'dev'
  );
}