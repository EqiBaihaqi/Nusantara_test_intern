import 'package:flutter/material.dart';
import 'package:nusantara_test/controller/auth_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome $email'),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance.logout();
                },
                child: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
