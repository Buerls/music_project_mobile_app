import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.put(AuthService());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    try {
      await _authService.signIn(
          emailController.text.trim(), passwordController.text.trim());
      Get.offAllNamed('/home');
    } catch (error) {
      Get.snackbar(
        'Sign in failed',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}