// ignore_for_file: prefer_initializing_formals, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class CustomTextFormField extends GetView {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  final bool? passwordVisible;
  final VoidCallback? onTapPasswordVisible;
  final TextEditingController? textEditingController;
  final bool textInputUsernameVisible;
  final bool textInputPasswordVisible;
  final bool? textInputEnable;
  final Color? fillColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? changeAccount;

  const CustomTextFormField(
      {super.key,
      this.onChanged,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction,
      this.inputFormatters,
      required this.labelText,
      this.validator,
      this.keyboardType,
      this.textCapitalization,
      this.passwordVisible,
      this.onTapPasswordVisible,
      this.textEditingController,
      required this.fillColor,
      required this.borderColor,
      required this.textInputEnable,
      required this.textInputUsernameVisible,
      required this.textInputPasswordVisible,
      required this.changeAccount});

  const CustomTextFormField.email(
      {super.key,
      this.onChanged,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction,
      this.inputFormatters,
      required this.labelText,
      this.validator,
      this.keyboardType,
      this.textCapitalization,
      this.passwordVisible,
      this.onTapPasswordVisible,
      this.textEditingController,
      required this.fillColor,
      required this.borderColor,
      required this.textInputEnable,
      required this.textInputUsernameVisible,
      required this.textInputPasswordVisible,
      required this.changeAccount});

  const CustomTextFormField.password(
      {super.key,
      FocusNode? focusNode,
      TextInputAction? textInputAction,
      required textInputPasswordVisible,
      required textInputUsernameVisible,
      required Function(String)? onChanged,
      Function(String)? onFieldSubmitted,
      List<TextInputFormatter>? inputFormatters,
      required String labelText,
      required String? Function(String?)? validator,
      TextInputType? keyboardType,
      TextCapitalization? textCapitalization,
      required bool passwordVisible,
      required VoidCallback? onTapPasswordVisible,
      this.textEditingController,
      required this.textInputEnable,
      required this.fillColor,
      required this.borderColor,
      required this.changeAccount})
      : this.onChanged = onChanged,
        this.onFieldSubmitted = onFieldSubmitted,
        this.focusNode = focusNode,
        this.textInputAction = textInputAction,
        this.inputFormatters = inputFormatters,
        this.labelText = labelText,
        this.validator = validator,
        this.keyboardType = keyboardType,
        this.textCapitalization = textCapitalization,
        this.passwordVisible = passwordVisible,
        this.onTapPasswordVisible = onTapPasswordVisible,
        this.textInputUsernameVisible = textInputUsernameVisible,
        this.textInputPasswordVisible = textInputPasswordVisible;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      enabled: textInputEnable,
      controller: textEditingController,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorColor: white,
      style: const TextStyle(
        color: white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          fillColor: fillColor,
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: textInputPasswordVisible || textInputUsernameVisible
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: red,
                    width: 1.0,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: green,
                    width: 1.0,
                  ),
                ),
          enabledBorder: textInputPasswordVisible || textInputUsernameVisible
              ? OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: red,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!, //Color(0xffE2E1E2),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: onTapPasswordVisible != null
              ? GestureDetector(
                  child: Icon(
                    passwordVisible == false
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: darkGray,
                  ),
                  onTap: () {
                    onTapPasswordVisible!();
                  },
                )
              : null),
      obscureText: passwordVisible ?? false,
      validator: validator,
    );
  }
}
