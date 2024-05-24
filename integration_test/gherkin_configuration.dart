import 'package:gherkin/gherkin.dart';

import 'gherkin/given/given_step_definition.dart';
import 'gherkin/then/then_steps_definition.dart';
import 'gherkin/when/when_steps_definition.dart';
import 'gherkin/parameters/custom_icon_parameter.dart';
import 'gherkin/parameters/custom_widget_parameter.dart';

final parameters = <CustomParameter<dynamic>>[
  CustomWidgetParameter(),
  CustomIconParameter(),
];

final stepDefinitions = <StepDefinitionGeneric<World>>[
  ...givenSteps,
  ...whenSteps,
  ...thenSteps,
];
