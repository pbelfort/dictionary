import 'package:flutter/material.dart';
import 'package:gherkin/gherkin.dart';

final Map<String, Type> customWidgetsMap = {
  'Text': Text,

  // ? Add more widgets here
};

class CustomWidgetParameter extends CustomParameter<Type> {
  CustomWidgetParameter()
      : super(
          'customWidget',
          RegExp("(${customWidgetsMap.keys.join(r'|')})", caseSensitive: true),
          (cw) {
            return customWidgetsMap[cw];
          },
        );
}
