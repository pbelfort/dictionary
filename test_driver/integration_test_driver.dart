import 'package:integration_test/integration_test_driver.dart'
    as integration_test_driver;

Future<void> main() {
  return integration_test_driver.integrationDriver(
    timeout: const Duration(minutes: 90),
  );
}
