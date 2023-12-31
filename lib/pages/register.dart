import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test/controller/auth_controller.dart';
import 'package:nusantara_test/models/login_field.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REGISTER',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Register New Account Fighters!',
              style: TextStyle(color: Colors.black38),
            ),
            const SizedBox(
              height: 25,
            ),
            MyField(
                controller: emailController,
                hintText: 'Email',
                obsecure: false),
            const SizedBox(
              height: 15,
            ),
            MyField(
                controller: passwordController,
                hintText: 'Password',
                obsecure: true),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance.register(
                        emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue[800], fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.blue[800]),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
