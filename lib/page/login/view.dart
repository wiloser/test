import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/customWidget/buttons.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    final state = Get.find<LoginLogic>().state;

    return Container(
      height: 500,
      child: Column(
        children: [
          loginTitle(),
          input(),
          loginButton(),
        ],
      ),
    );
  }

  Widget loginTitle() {
    return Container(
      height: 80,
      child: Column(
        children: [
          Text(
            'Create an account',
            style: TextStyle(decoration: TextDecoration.none, fontSize: 15),
          ),
          Text(
            'by clicking on "create account" you agree to our terms of service and privacy policy.',
            style: TextStyle(decoration: TextDecoration.none, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget input() {
    return Material(
      child: SizedBox(
        height: 175,
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return ButtonWidget(
      child: Text('login'),
    );
  }
}
