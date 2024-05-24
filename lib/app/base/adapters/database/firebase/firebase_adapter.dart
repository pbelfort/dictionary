import 'package:dictionary/app/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../firebase_options.dart';
import 'i_firebase_adapter.dart';

class FirebaseAdapter implements IFirebaseAdapter {
  @override
  Future<void> initializeApp() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  bool userIsLoggedIn() => FirebaseAuth.instance.currentUser != null;

  User? getUser() => FirebaseAuth.instance.currentUser;

  @override
  Future<bool> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showSignInErrorSnackBar(
          title: 'User not found',
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        _showSignInErrorSnackBar(
          title: 'Wrong password',
          message: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-credential') {
        _showSignInErrorSnackBar(
          title: 'Invalid credential',
          message: 'Invalid credential provided for that user.',
        );
      }
    }
    return false;
  }
}

void _showSignInErrorSnackBar({
  required String title,
  required String message,
}) {
  Get.snackbar(
    title,
    message,
    instantInit: true,
    colorText: red,
    backgroundColor: green,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 4),
    margin: const EdgeInsets.all(16),
    icon: const Icon(
      Icons.warning,
      color: red,
    ),
  );
}
