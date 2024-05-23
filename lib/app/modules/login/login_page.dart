import 'package:dictionary/app/theme/app_colors.dart';
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
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Center(
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
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: appBackgroundColor),
                              child: Center(
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    color: green,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Acessar sua conta',
                            ),
                            const SizedBox(height: 23),
                            Stack(
                              children: [
                                Obx(
                                  () => CustomTextFormField.email(
                                    textEditingController:
                                        controller.loginTextController,
                                    changeAccount: true,
                                    borderColor: white,
                                    fillColor: appBackgroundColor,
                                    textInputEnable: true,
                                    textInputUsernameVisible: controller
                                        .textInputUsernameVisible.value,
                                    textInputPasswordVisible: controller
                                        .textInputPasswordVisible.value,
                                    onChanged: (value) {},
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    labelText: 'E-mail',
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              alignment: Alignment.topLeft,
                              child: Obx(
                                () => Visibility(
                                  visible:
                                      controller.txtEmailWrongVisible.value,
                                  child: Text(
                                    controller.messageTextError.value,
                                    style: const TextStyle(color: red),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => CustomTextFormField.password(
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
                                labelText: 'Senha',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'A sua senha deve conter no mínimo 6 caracteres.';
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
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 200.0),
                              child: CustomButtonWidget(
                                borderRadius: 10,
                                hasIcon: false,
                                height: 40,
                                width: Get.width,
                                title: 'Entrar',
                                style: CustomButtonStyle.styleGreen,
                                onPressed: () async {
                                  if (controller.formKeyLogin.currentState!
                                      .validate()) {
                                    await controller.signIn();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
