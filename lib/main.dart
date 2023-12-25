import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/page/home/view.dart';
import 'common/routes.dart';
import 'manager/screenInfoManager.dart';

void main() {
  run();
}

void run(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenInfoManager.instance.init(context);
    return GetMaterialApp(
      initialRoute: '/', // 设置初始路由
      getPages: Routes.routes, //
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}