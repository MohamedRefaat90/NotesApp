// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_input_data.g.dart';

@JsonSerializable()
class UserInputData {
  final String username;
  final String password;
  UserInputData({
    required this.username,
    required this.password,
  });

  factory UserInputData.fromJson(Map<String, dynamic> json) =>
      _$UserInputDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserInputDataToJson(this);
}
