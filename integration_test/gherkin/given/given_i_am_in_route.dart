import 'package:dictionary/app/modules/login/login_controller.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:get/get.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenIAmInHome() {
  return given<FlutterWorld>(
    'I am in route home',
    (context) async {
      final loginController = Get.find<LoginController>();
      loginController.loginTextController.text = "teste@teste.com";
      loginController.passTextController.text = "Abc123";

      await loginController.signIn();

      await context.world.appDriver.waitForAppToSettle();
    },
  );
}
