import 'package:flutter/material.dart';
import 'package:gherkin/gherkin.dart';

// ? Add icons here
final Map<String, IconData> customIcons = {
  'close': Icons.close,
  'star': Icons.star,
};

class CustomIconParameter extends CustomParameter<IconData> {
  CustomIconParameter()
      : super(
          'iconData',
          RegExp("(${customIcons.keys.join(r'|')})", caseSensitive: true),
          (icon) {
            return customIcons[icon];
          },
        );
}
