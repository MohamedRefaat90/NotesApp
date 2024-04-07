// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginStates<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(T token) successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function(T token)? successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(T token)? successState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginintiState<T> value) initState,
    required TResult Function(LoginSuccessState<T> value) successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginintiState<T> value)? initState,
    TResult? Function(LoginSuccessState<T> value)? successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginintiState<T> value)? initState,
    TResult Function(LoginSuccessState<T> value)? successState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStatesCopyWith<T, $Res> {
  factory $LoginStatesCopyWith(
          LoginStates<T> value, $Res Function(LoginStates<T>) then) =
      _$LoginStatesCopyWithImpl<T, $Res, LoginStates<T>>;
}

/// @nodoc
class _$LoginStatesCopyWithImpl<T, $Res, $Val extends LoginStates<T>>
    implements $LoginStatesCopyWith<T, $Res> {
  _$LoginStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginintiStateImplCopyWith<T, $Res> {
  factory _$$LoginintiStateImplCopyWith(_$LoginintiStateImpl<T> value,
          $Res Function(_$LoginintiStateImpl<T>) then) =
      __$$LoginintiStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoginintiStateImplCopyWithImpl<T, $Res>
    extends _$LoginStatesCopyWithImpl<T, $Res, _$LoginintiStateImpl<T>>
    implements _$$LoginintiStateImplCopyWith<T, $Res> {
  __$$LoginintiStateImplCopyWithImpl(_$LoginintiStateImpl<T> _value,
      $Res Function(_$LoginintiStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginintiStateImpl<T> implements LoginintiState<T> {
  const _$LoginintiStateImpl();

  @override
  String toString() {
    return 'LoginStates<$T>.initState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginintiStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(T token) successState,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function(T token)? successState,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(T token)? successState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginintiState<T> value) initState,
    required TResult Function(LoginSuccessState<T> value) successState,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginintiState<T> value)? initState,
    TResult? Function(LoginSuccessState<T> value)? successState,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginintiState<T> value)? initState,
    TResult Function(LoginSuccessState<T> value)? successState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class LoginintiState<T> implements LoginStates<T> {
  const factory LoginintiState() = _$LoginintiStateImpl<T>;
}

/// @nodoc
abstract class _$$LoginSuccessStateImplCopyWith<T, $Res> {
  factory _$$LoginSuccessStateImplCopyWith(_$LoginSuccessStateImpl<T> value,
          $Res Function(_$LoginSuccessStateImpl<T>) then) =
      __$$LoginSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T token});
}

/// @nodoc
class __$$LoginSuccessStateImplCopyWithImpl<T, $Res>
    extends _$LoginStatesCopyWithImpl<T, $Res, _$LoginSuccessStateImpl<T>>
    implements _$$LoginSuccessStateImplCopyWith<T, $Res> {
  __$$LoginSuccessStateImplCopyWithImpl(_$LoginSuccessStateImpl<T> _value,
      $Res Function(_$LoginSuccessStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$LoginSuccessStateImpl<T>(
      freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoginSuccessStateImpl<T> implements LoginSuccessState<T> {
  const _$LoginSuccessStateImpl(this.token);

  @override
  final T token;

  @override
  String toString() {
    return 'LoginStates<$T>.successState(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessStateImplCopyWith<T, _$LoginSuccessStateImpl<T>>
      get copyWith =>
          __$$LoginSuccessStateImplCopyWithImpl<T, _$LoginSuccessStateImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(T token) successState,
  }) {
    return successState(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function(T token)? successState,
  }) {
    return successState?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(T token)? successState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginintiState<T> value) initState,
    required TResult Function(LoginSuccessState<T> value) successState,
  }) {
    return successState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginintiState<T> value)? initState,
    TResult? Function(LoginSuccessState<T> value)? successState,
  }) {
    return successState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginintiState<T> value)? initState,
    TResult Function(LoginSuccessState<T> value)? successState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState(this);
    }
    return orElse();
  }
}

abstract class LoginSuccessState<T> implements LoginStates<T> {
  const factory LoginSuccessState(final T token) = _$LoginSuccessStateImpl<T>;

  T get token;
  @JsonKey(ignore: true)
  _$$LoginSuccessStateImplCopyWith<T, _$LoginSuccessStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
