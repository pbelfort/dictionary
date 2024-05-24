import 'dart:developer';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:dictionary/main.dart' as app;
import 'gherkin_configuration.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: stepDefinitions,
      customStepParameterDefinitions: parameters,
      order: ExecutionOrder.alphabetical,
      features: [RegExp('features/*.*.feature')],
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(log)
          ..setWriteFn(log),
        ProgressReporter()
          ..setWriteLineFn(log)
          ..setWriteFn(log),
        TestRunSummaryReporter()
          ..setWriteLineFn(log)
          ..setWriteFn(log),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        )
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}
