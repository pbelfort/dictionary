import 'package:dictionary/app/theme/app_colors.dart';
import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Obx(
          () => controller.showLoading.value
              ? const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: green,
                    ),
                  ),
                )
              : Form(
                  key: controller.formKeyLogin,
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: controller.animatedPadding.value,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Insert your email and password to log in',
                          style: appTextStyle.withColor(white),
                        ),
                        const SizedBox(height: 23),
                        Stack(
                          children: [
                            Obx(
                              () => TapRegion(
                                onTapInside: (_) =>
                                    controller.scaleKeyboard(280),
                                onTapOutside: (_) {
                                  FocusScope.of(context).unfocus();
                                  controller.scaleKeyboard(350);
                                },
                                child: CustomTextFormField.email(
                                  textEditingController:
                                      controller.loginTextController,
                                  changeAccount: true,
                                  borderColor: white,
                                  fillColor: appBackgroundColor,
                                  textInputEnable: true,
                                  textInputUsernameVisible:
                                      controller.textInputUsernameVisible.value,
                                  textInputPasswordVisible:
                                      controller.textInputPasswordVisible.value,
                                  onChanged: (value) {},
                                  keyboardType: TextInputType.emailAddress,
                                  textCapitalization: TextCapitalization.none,
                                  labelText: 'E-mail',
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Insert a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Obx(
                            () => Visibility(
                              visible: controller.txtEmailWrongVisible.value,
                              child: Text(
                                controller.messageTextError.value,
                                style: const TextStyle(color: red),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => TapRegion(
                            onTapInside: (_) => controller.scaleKeyboard(250),
                            onTapOutside: (_) {
                              FocusScope.of(context).unfocus();
                              controller.scaleKeyboard(350);
                            },
                            child: CustomTextFormField.password(
                              textEditingController:
                                  controller.passTextController,
                              changeAccount: true,
                              borderColor: white,
                              fillColor: appBackgroundColor,
                              textInputEnable: true,
                              textInputUsernameVisible:
                                  controller.textInputPasswordVisible.value,
                              textInputPasswordVisible:
                                  controller.textInputPasswordVisible.value,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              labelText: 'Password',
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Your password need to have more than six characteres';
                                }
                                return null;
                              },
                              passwordVisible: controller.showPassword.value,
                              onTapPasswordVisible: () {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: CustomButtonWidget(
                            borderRadius: 10,
                            hasIcon: false,
                            height: 40,
                            width: Get.width,
                            title: 'Login',
                            style: CustomButtonStyle.styleGreen,
                            onPressed: () async {
                              if (controller.formKeyLogin.currentState!
                                  .validate()) {
                                await controller.signIn();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
