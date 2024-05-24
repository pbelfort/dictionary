import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenIWaitAppToStop() {
  return when<FlutterWidgetTesterWorld>(
    'I wait app to stop',
    (context) async {
      await context.world.appDriver.waitForAppToSettle();
    },
  );
}
