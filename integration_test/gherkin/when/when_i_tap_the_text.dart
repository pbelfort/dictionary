import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenITapTheText() {
  return when1<String, FlutterWidgetTesterWorld>(
    'I tap the text {string}',
    (customWidget, context) async {
      final tester = context.world.appDriver.nativeDriver;
      final widgetFinder = find.text(customWidget).first;
      expect(widgetFinder, findsWidgets);
      await tester.tap(widgetFinder);
      
      await context.world.appDriver.waitForAppToSettle();
    },
  );
}
