import 'package:get/get.dart';
import 'package:nusantara_test/pages/register.dart';

import '../pages/login.dart';

class AllPages {
  static final pages = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/regist', page: () => Register())
  ];
}
