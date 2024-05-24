import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenITapTheIcon() {
  return when1<IconData, FlutterWidgetTesterWorld>(
    'I tap the {iconData} icon',
    (iconData, context) async {
      final tester = context.world.appDriver.nativeDriver;
      final iconFinder = find.byIcon(iconData).first;
      expect(iconFinder, findsWidgets);
      await tester.tap(iconFinder);
      await context.world.appDriver.waitForAppToSettle();
    },
  );
}
