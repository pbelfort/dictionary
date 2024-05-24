import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenITapTheWidget() {
  return when1<Type, FlutterWidgetTesterWorld>(
    'I tap the {customWidget} widget',
    (customWidget, context) async {
      final tester = context.world.appDriver.nativeDriver;
      final widgetFinder = find.byType(customWidget).first;
      await tester.tap(widgetFinder);
      await tester.pumpAndSettle();
    },
  );
}
