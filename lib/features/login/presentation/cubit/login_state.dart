import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginStates<T> with _$LoginStates<T> {
  const factory LoginStates.initState() = LoginintiState<T>;
  const factory LoginStates.successState(T token) = LoginSuccessState<T>;
}
