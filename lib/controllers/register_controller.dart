import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService _authService = Get.put(AuthService());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUp() async {
    try {
      await _authService.signUp(
          emailController.text.trim(), passwordController.text.trim(),nameController.text.trim());
      Get.offAllNamed('/home');
    } catch (error) {
      Get.snackbar(
        'Sign up failed',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}