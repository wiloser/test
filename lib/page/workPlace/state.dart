import 'package:get/get.dart';
import 'package:test_work/model/questionModel.dart';

class WorkPlaceState {
  WorkPlaceState() {
    ///Initialize variables
  }
  final String title = '遵守道德规范 锤炼道德品格';
  String get t => '37/61 练背';

  String get problem => '多选题作为社会意识的道德一经产生,便有相对独立性.这种相对独立性表现为';
  int index = 0;
  get answers => ['道德的历史继承性'];
  get detail => ['正确答案'];
  RxInt finish = 3.obs;
  RxInt all = 10.obs;
  List<RxBool> activates = [false.obs,false.obs,false.obs,false.obs,];

  RxBool questionDateIsEmpty = true.obs;
  List<QuestionModel> questions = [];
}
