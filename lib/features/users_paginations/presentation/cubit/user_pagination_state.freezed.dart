// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPaginationState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T errorMsg) failure,
    required TResult Function() initial,
    required TResult Function() pagination,
    required TResult Function(T users) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T errorMsg)? failure,
    TResult? Function()? initial,
    TResult? Function()? pagination,
    TResult? Function(T users)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T errorMsg)? failure,
    TResult Function()? initial,
    TResult Function()? pagination,
    TResult Function(T users)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Pagination<T> value) pagination,
    required TResult Function(_Success<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Pagination<T> value)? pagination,
    TResult? Function(_Success<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Pagination<T> value)? pagination,
    TResult Function(_Success<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPaginationStateCopyWith<T, $Res> {
  factory $UserPaginationStateCopyWith(UserPaginationState<T> value,
          $Res Function(UserPaginationState<T>) then) =
      _$UserPaginationStateCopyWithImpl<T, $Res, UserPaginationState<T>>;
}

/// @nodoc
class _$UserPaginationStateCopyWithImpl<T, $Res,
        $Val extends UserPaginationState<T>>
    implements $UserPaginationStateCopyWith<T, $Res> {
  _$UserPaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T errorMsg});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$UserPaginationStateCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> implements _Failure<T> {
  const _$FailureImpl(this.errorMsg);

  @override
  final T errorMsg;

  @override
  String toString() {
    return 'UserPaginationState<$T>.failure(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T errorMsg) failure,
    required TResult Function() initial,
    required TResult Function() pagination,
    required TResult Function(T users) success,
  }) {
    return failure(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T errorMsg)? failure,
    TResult? Function()? initial,
    TResult? Function()? pagination,
    TResult? Function(T users)? success,
  }) {
    return failure?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T errorMsg)? failure,
    TResult Function()? initial,
    TResult Function()? pagination,
    TResult Function(T users)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Pagination<T> value) pagination,
    required TResult Function(_Success<T> value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Pagination<T> value)? pagination,
    TResult? Function(_Success<T> value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Pagination<T> value)? pagination,
    TResult Function(_Success<T> value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<T> implements UserPaginationState<T> {
  const factory _Failure(final T errorMsg) = _$FailureImpl<T>;

  T get errorMsg;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$UserPaginationStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserPaginationState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T errorMsg) failure,
    required TResult Function() initial,
    required TResult Function() pagination,
    required TResult Function(T users) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T errorMsg)? failure,
    TResult? Function()? initial,
    TResult? Function()? pagination,
    TResult? Function(T users)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T errorMsg)? failure,
    TResult Function()? initial,
    TResult Function()? pagination,
    TResult Function(T users)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Pagination<T> value) pagination,
    required TResult Function(_Success<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Pagination<T> value)? pagination,
    TResult? Function(_Success<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Pagination<T> value)? pagination,
    TResult Function(_Success<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements UserPaginationState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<T, $Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl<T> value, $Res Function(_$PaginationImpl<T>) then) =
      __$$PaginationImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<T, $Res>
    extends _$UserPaginationStateCopyWithImpl<T, $Res, _$PaginationImpl<T>>
    implements _$$PaginationImplCopyWith<T, $Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl<T> _value, $Res Function(_$PaginationImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaginationImpl<T> implements _Pagination<T> {
  const _$PaginationImpl();

  @override
  String toString() {
    return 'UserPaginationState<$T>.pagination()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaginationImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T errorMsg) failure,
    required TResult Function() initial,
    required TResult Function() pagination,
    required TResult Function(T users) success,
  }) {
    return pagination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T errorMsg)? failure,
    TResult? Function()? initial,
    TResult? Function()? pagination,
    TResult? Function(T users)? success,
  }) {
    return pagination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T errorMsg)? failure,
    TResult Function()? initial,
    TResult Function()? pagination,
    TResult Function(T users)? success,
    required TResult orElse(),
  }) {
    if (pagination != null) {
      return pagination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Pagination<T> value) pagination,
    required TResult Function(_Success<T> value) success,
  }) {
    return pagination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Pagination<T> value)? pagination,
    TResult? Function(_Success<T> value)? success,
  }) {
    return pagination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Pagination<T> value)? pagination,
    TResult Function(_Success<T> value)? success,
    required TResult orElse(),
  }) {
    if (pagination != null) {
      return pagination(this);
    }
    return orElse();
  }
}

abstract class _Pagination<T> implements UserPaginationState<T> {
  const factory _Pagination() = _$PaginationImpl<T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T users});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$UserPaginationStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements _Success<T> {
  const _$SuccessImpl(this.users);

  @override
  final T users;

  @override
  String toString() {
    return 'UserPaginationState<$T>.success(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T errorMsg) failure,
    required TResult Function() initial,
    required TResult Function() pagination,
    required TResult Function(T users) success,
  }) {
    return success(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T errorMsg)? failure,
    TResult? Function()? initial,
    TResult? Function()? pagination,
    TResult? Function(T users)? success,
  }) {
    return success?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T errorMsg)? failure,
    TResult Function()? initial,
    TResult Function()? pagination,
    TResult Function(T users)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Pagination<T> value) pagination,
    required TResult Function(_Success<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Pagination<T> value)? pagination,
    TResult? Function(_Success<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Pagination<T> value)? pagination,
    TResult Function(_Success<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements UserPaginationState<T> {
  const factory _Success(final T users) = _$SuccessImpl<T>;

  T get users;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
