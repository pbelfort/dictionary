import 'package:flutter/material.dart';

const appTextStyle = AppTextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    super.color,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.fontFamily,
  });

  AppTextStyle copyWithExtended({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
  }) {
    return AppTextStyle(
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  AppTextStyle withColor(Color color) => copyWithExtended(color: color);
  AppTextStyle withFontSize(double fontSize) =>
      copyWithExtended(fontSize: fontSize);
  AppTextStyle withFontWeight(FontWeight fontWeight) =>
      copyWithExtended(fontWeight: fontWeight);
  AppTextStyle withLetterSpacing(double letterSpacing) =>
      copyWithExtended(letterSpacing: letterSpacing);
  AppTextStyle withWordSpacing(double wordSpacing) =>
      copyWithExtended(wordSpacing: wordSpacing);
  AppTextStyle withFontFamily(String fontFamily) =>
      copyWithExtended(fontFamily: fontFamily);
}
