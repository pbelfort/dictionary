import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends ApplicationController {
  // Form login
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final loginTextController = TextEditingController();
  final passTextController = TextEditingController();

  RxBool textInputUsernameVisible = false.obs;
  RxBool textInputPasswordVisible = false.obs;
  RxBool txtPasswordWrongVisible = false.obs;
  RxBool txtEmailWrongVisible = false.obs;
  RxBool showPassword = true.obs;
  RxString messageTextError = ''.obs;

  Future<void> signIn() async {
    showLoading.value = true;
    final userSignedIn = await firebaseAdapter.signInWithEmailAndPassword(
      emailAddress: loginTextController.text,
      password: passTextController.text,
    );
    showLoading.value = false;

    if (userSignedIn) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
