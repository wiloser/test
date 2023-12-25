import 'package:flutter/material.dart';
import 'package:test_work/model/questionModel.dart';

class HomeState {
  HomeState();

  String get title => 'Flutter Demo Home Page';

  final TextEditingController inputEditController = TextEditingController();

  QuestionModel get questionModel => QuestionModel.fromJson({
    'question': '1+2=?',
    'answer': '3',
    'introduce': '这是一个填空题',
  });
}
