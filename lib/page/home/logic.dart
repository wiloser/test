import 'package:get/get.dart';
import 'package:test_work/api/api.dart';

import '../../common/routes.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  void toWorkPlace() {
    Get.toNamed(Routes.work);
  }

  void toInfoPlace() async {
    var data = await Api.login();
    print(data.toString());
    print('jjj');
    // Get.toNamed(Routes.info);
  }

  void toSelectPlace() {
    // Get.toNamed(Routes.select);
  }

  void toWords() {
    // Get.toNamed(Routes.words);
  }

  void toLogin() {
    Get.toNamed(Routes.login);
  }
}
