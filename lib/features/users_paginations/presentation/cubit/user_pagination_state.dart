import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pagination_state.freezed.dart';

@freezed
class UserPaginationState<T> with _$UserPaginationState<T> {
  const factory UserPaginationState.failure(T errorMsg) = _Failure<T>;
  const factory UserPaginationState.initial() = _Initial<T>;
  const factory UserPaginationState.pagination() = _Pagination<T>;
  const factory UserPaginationState.success(T users) = _Success<T>;
}
