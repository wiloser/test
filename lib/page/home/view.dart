import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/customWidget/buttons.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(state.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonWidget(
              onTap: logic.toWorkPlace,
              child: const Text('workPlace'),
            ),
            ButtonWidget(
              onTap: logic.toInfoPlace,
              child: const Text('infoPlace'),
            ),
            ButtonWidget(
              onTap: logic.toSelectPlace,
              child: const Text('selectPlace'),
            ),
            ButtonWidget(
              onTap: logic.toWords,
              child: const Text('toWords'),
            ),
            ButtonWidget(
              onTap: logic.toLogin,
              child: const Text('toLogin'),
            ),
            ButtonWidget(
              onTap: logic.toTest,
              child: const Text('toTest'),
            ),
          ],
        ),
      ),
    );
  }
}
