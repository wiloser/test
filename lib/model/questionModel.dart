import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'questionModel.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(defaultValue: "")
  final String id;

  @JsonKey(defaultValue: "")
  final String question_text;

  @JsonKey(defaultValue: "")
  final String introduce_answer;

  @JsonKey(defaultValue: "")
  final String question_tpye;

  @JsonKey(defaultValue: "")
  final String pub_date;

  ///Todo
  // // @JsonKey(fromJson: StudyDetailModel.fromJson())
  // final StudyDetailModel studyDetail;

  QuestionModel(this.id,
      {required this.question_text,
      required this.introduce_answer,
      required this.question_tpye,
      required this.pub_date});

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

// @JsonSerializable()
// class StudyDetailModel {
//   @JsonKey(defaultValue: "")
//   final String keyWords;
//
//   @JsonKey(defaultValue: "")
//   final String analogy;
//
//   @JsonKey(defaultValue: 0)
//   final double difficult;
//
//   // @JsonKey(defaultValue: 0)
//   ///todo
//   // final DateTime dateTime;
//
//   StudyDetailModel(this.keyWords, this.analogy, this.difficult, this.dateTime);
//
//   factory StudyDetailModel.fromJson(Map<String, dynamic> json) =>
//       _$StudyDetailModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$StudyDetailModelToJson(this);
// }
