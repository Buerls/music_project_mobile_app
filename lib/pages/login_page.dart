import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _loginController.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _loginController.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Parola',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _loginController.signIn();
              },
              child: Text('Giriş Yap'),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/register');
              },
              child: Text('Üye değil misin? Üye ol!'),
            ),
          ],
        ),
      ),
    );
  }
}