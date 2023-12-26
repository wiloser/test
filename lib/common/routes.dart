// routes.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/page/home/view.dart';
import 'package:test_work/page/login/view.dart';
import 'package:test_work/page/workPlace/view.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: work, page: () => WorkPlacePage()),
    GetPage(name: info, page: () => Container()),
    GetPage(name: select, page: () => Container()),
    GetPage(name: login, page: () => LoginPage()),
  ];

  static String get work => '/work';

  static String get info => '/work';

  static String get select => '/select';

  static String get login => '/login';
}
