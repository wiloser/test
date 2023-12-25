import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/questionModel.dart';
import 'state.dart';

class WorkPlaceLogic extends GetxController {
  final WorkPlaceState state = WorkPlaceState();

  @override
  void onInit() {
    super.onInit();
    getQuestions();
  }

  Future<void> getQuestions() async {
    var response = await Api.getQuestion();
    if (response.statusCode == 200) {
      state.questions.clear();
      for (var data in response.data) {
        state.questions.add(QuestionModel.fromJson(data));
      }
    }
    if(state.questions.isNotEmpty){
      state.questionDateIsEmpty.value = false;
    }else{
      state.questionDateIsEmpty.value = true;
    }
  }
}
