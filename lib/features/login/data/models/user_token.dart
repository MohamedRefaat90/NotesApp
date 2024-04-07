import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_token.g.dart';

@JsonSerializable()
class userToken {
  final String token;

  userToken({required this.token});

  factory userToken.fromJson(Map<String, dynamic> json) =>
      _$userTokenFromJson(json);

  Map<String, dynamic> toJson() => _$userTokenToJson(this);
}
