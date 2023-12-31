import 'package:flutter/material.dart';
import 'package:nusantara_test/controller/auth_controller.dart';
import 'package:nusantara_test/pages/login.dart';
import 'package:get/get.dart';
import 'package:nusantara_test/routes/pageroute.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    Get.put(AuthController());
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        getPages: AllPages.pages);
  }
}
