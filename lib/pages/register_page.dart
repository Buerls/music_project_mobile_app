import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _registerController.nameController,
              decoration: InputDecoration(
                labelText: 'Tam İsim',
              ),
            ),
            TextFormField(
              controller: _registerController.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _registerController.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Parola',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _registerController.signUp();
              },
              child: Text('Üye Ol'),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/login');
              },
              child: Text('Zaten üye misin? Giriş yap!'),
            ),
          ],
        ),
      ),
    );
  }
}
