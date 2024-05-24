import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:get/get.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenIAmInHome() {
  return given<FlutterWorld>(
    'I am in route home',
    (context) async {
      Get.toNamed(
        Routes.HOME,
        arguments: {},
      );
      await context.world.appDriver.waitForAppToSettle();
    },
  );
}
