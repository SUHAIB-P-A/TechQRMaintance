// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_token_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetTokenEvent {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) getTokenevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? getTokenevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? getTokenevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTokenevent value) getTokenevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTokenevent value)? getTokenevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTokenevent value)? getTokenevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GetTokenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTokenEventCopyWith<GetTokenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTokenEventCopyWith<$Res> {
  factory $GetTokenEventCopyWith(
          GetTokenEvent value, $Res Function(GetTokenEvent) then) =
      _$GetTokenEventCopyWithImpl<$Res, GetTokenEvent>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$GetTokenEventCopyWithImpl<$Res, $Val extends GetTokenEvent>
    implements $GetTokenEventCopyWith<$Res> {
  _$GetTokenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTokenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTokeneventImplCopyWith<$Res>
    implements $GetTokenEventCopyWith<$Res> {
  factory _$$GetTokeneventImplCopyWith(
          _$GetTokeneventImpl value, $Res Function(_$GetTokeneventImpl) then) =
      __$$GetTokeneventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$GetTokeneventImplCopyWithImpl<$Res>
    extends _$GetTokenEventCopyWithImpl<$Res, _$GetTokeneventImpl>
    implements _$$GetTokeneventImplCopyWith<$Res> {
  __$$GetTokeneventImplCopyWithImpl(
      _$GetTokeneventImpl _value, $Res Function(_$GetTokeneventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTokenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$GetTokeneventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTokeneventImpl implements GetTokenevent {
  const _$GetTokeneventImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'GetTokenEvent.getTokenevent(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTokeneventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of GetTokenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTokeneventImplCopyWith<_$GetTokeneventImpl> get copyWith =>
      __$$GetTokeneventImplCopyWithImpl<_$GetTokeneventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) getTokenevent,
  }) {
    return getTokenevent(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? getTokenevent,
  }) {
    return getTokenevent?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? getTokenevent,
    required TResult orElse(),
  }) {
    if (getTokenevent != null) {
      return getTokenevent(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTokenevent value) getTokenevent,
  }) {
    return getTokenevent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTokenevent value)? getTokenevent,
  }) {
    return getTokenevent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTokenevent value)? getTokenevent,
    required TResult orElse(),
  }) {
    if (getTokenevent != null) {
      return getTokenevent(this);
    }
    return orElse();
  }
}

abstract class GetTokenevent implements GetTokenEvent {
  const factory GetTokenevent(
      {required final String email,
      required final String password}) = _$GetTokeneventImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of GetTokenEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTokeneventImplCopyWith<_$GetTokeneventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetTokenState {
  String get text => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;

  /// Create a copy of GetTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTokenStateCopyWith<GetTokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTokenStateCopyWith<$Res> {
  factory $GetTokenStateCopyWith(
          GetTokenState value, $Res Function(GetTokenState) then) =
      _$GetTokenStateCopyWithImpl<$Res, GetTokenState>;
  @useResult
  $Res call({String text, bool isLoading, bool isFailure});
}

/// @nodoc
class _$GetTokenStateCopyWithImpl<$Res, $Val extends GetTokenState>
    implements $GetTokenStateCopyWith<$Res> {
  _$GetTokenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isLoading = null,
    Object? isFailure = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTokenStateImplCopyWith<$Res>
    implements $GetTokenStateCopyWith<$Res> {
  factory _$$GetTokenStateImplCopyWith(
          _$GetTokenStateImpl value, $Res Function(_$GetTokenStateImpl) then) =
      __$$GetTokenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool isLoading, bool isFailure});
}

/// @nodoc
class __$$GetTokenStateImplCopyWithImpl<$Res>
    extends _$GetTokenStateCopyWithImpl<$Res, _$GetTokenStateImpl>
    implements _$$GetTokenStateImplCopyWith<$Res> {
  __$$GetTokenStateImplCopyWithImpl(
      _$GetTokenStateImpl _value, $Res Function(_$GetTokenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isLoading = null,
    Object? isFailure = null,
  }) {
    return _then(_$GetTokenStateImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetTokenStateImpl implements _GetTokenState {
  const _$GetTokenStateImpl(
      {required this.text, required this.isLoading, required this.isFailure});

  @override
  final String text;
  @override
  final bool isLoading;
  @override
  final bool isFailure;

  @override
  String toString() {
    return 'GetTokenState(text: $text, isLoading: $isLoading, isFailure: $isFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTokenStateImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, isLoading, isFailure);

  /// Create a copy of GetTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTokenStateImplCopyWith<_$GetTokenStateImpl> get copyWith =>
      __$$GetTokenStateImplCopyWithImpl<_$GetTokenStateImpl>(this, _$identity);
}

abstract class _GetTokenState implements GetTokenState {
  const factory _GetTokenState(
      {required final String text,
      required final bool isLoading,
      required final bool isFailure}) = _$GetTokenStateImpl;

  @override
  String get text;
  @override
  bool get isLoading;
  @override
  bool get isFailure;

  /// Create a copy of GetTokenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTokenStateImplCopyWith<_$GetTokenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
