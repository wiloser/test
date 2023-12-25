import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(defaultValue: "")
  final String id;

  @JsonKey(defaultValue: "")
  final String name;

  @JsonKey(defaultValue: "")
  final String mm;

  UserModel(this.id, this.name, this.mm,);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
