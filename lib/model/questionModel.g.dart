// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      json['id'] as String? ?? '',
      question_text: json['question_text'] as String? ?? '',
      introduce_answer: json['introduce_answer'] as String? ?? '',
      question_tpye: json['question_tpye'] as String? ?? '',
      pub_date: json['pub_date'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.question_text,
      'introduce_answer': instance.introduce_answer,
      'question_tpye': instance.question_tpye,
      'pub_date': instance.pub_date,
    };
