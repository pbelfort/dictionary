import 'package:dictionary/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonStyle {
  static final styleGreen = CustomButtonStyle(
    backgroundColor: green,
    titleColor: appBackgroundColor,
    fontSize: 16,
  );

  final Color backgroundColor;
  final Color titleColor;
  final double fontSize;
  final Color borderColor;

  CustomButtonStyle({
    required this.backgroundColor,
    required this.titleColor,
    required this.fontSize,
    this.borderColor = Colors.white,
  });
}

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final CustomButtonStyle style;
  final EdgeInsets margin;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final bool border;
  final double? borderRadius;
  final bool disabled;
  final bool hasIcon;
  final IconData? iconData;
  final Color? iconColor;
  final String? iconSvg;
  final FocusNode? focusNode;

  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.style,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.border = false,
    this.borderRadius,
    this.disabled = false,
    this.hasIcon = false,
    this.iconSvg = "",
    this.iconColor,
    this.iconData,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      margin: margin,
      width: width,
      child: TextButton(
        focusNode: focusNode,
        onPressed: disabled ? null : onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: disabled
              ? style.backgroundColor.withOpacity(0.5)
              : style.backgroundColor,
          shape: border
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                  side: BorderSide(
                    color: style.borderColor,
                    width: 1,
                  ),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                ),
        ),
        child: hasIcon
            ? Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: style.fontSize,
                    fontWeight: FontWeight.w600,
                    color: disabled ? style.titleColor : style.titleColor,
                  ),
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: style.fontSize,
                  fontWeight: FontWeight.bold,
                  color: disabled ? style.titleColor : style.titleColor,
                ),
              ),
      ),
    );
  }
}
