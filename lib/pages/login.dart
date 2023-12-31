import 'package:flutter/material.dart';
import 'package:nusantara_test/models/login_field.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_3_rounded,
              size: 85,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome Back Fighters!',
              style: TextStyle(color: Colors.black38),
            ),
            const SizedBox(
              height: 25,
            ),
            MyField(
                controller: usernameController,
                hintText: 'Username',
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
            Container(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.blue[800], fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/regist');
                  },
                  child: Text(
                    'Register',
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
