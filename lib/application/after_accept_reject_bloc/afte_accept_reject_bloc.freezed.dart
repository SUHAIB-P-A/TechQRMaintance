// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'afte_accept_reject_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AfteAcceptRejectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String servid) accept,
    required TResult Function(String servid) reject,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String servid)? accept,
    TResult? Function(String servid)? reject,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String servid)? accept,
    TResult Function(String servid)? reject,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Accept value) accept,
    required TResult Function(Reject value) reject,
    required TResult Function(Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Accept value)? accept,
    TResult? Function(Reject value)? reject,
    TResult? Function(Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Accept value)? accept,
    TResult Function(Reject value)? reject,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AfteAcceptRejectEventCopyWith<$Res> {
  factory $AfteAcceptRejectEventCopyWith(AfteAcceptRejectEvent value,
          $Res Function(AfteAcceptRejectEvent) then) =
      _$AfteAcceptRejectEventCopyWithImpl<$Res, AfteAcceptRejectEvent>;
}

/// @nodoc
class _$AfteAcceptRejectEventCopyWithImpl<$Res,
        $Val extends AfteAcceptRejectEvent>
    implements $AfteAcceptRejectEventCopyWith<$Res> {
  _$AfteAcceptRejectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AcceptImplCopyWith<$Res> {
  factory _$$AcceptImplCopyWith(
          _$AcceptImpl value, $Res Function(_$AcceptImpl) then) =
      __$$AcceptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String servid});
}

/// @nodoc
class __$$AcceptImplCopyWithImpl<$Res>
    extends _$AfteAcceptRejectEventCopyWithImpl<$Res, _$AcceptImpl>
    implements _$$AcceptImplCopyWith<$Res> {
  __$$AcceptImplCopyWithImpl(
      _$AcceptImpl _value, $Res Function(_$AcceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servid = null,
  }) {
    return _then(_$AcceptImpl(
      servid: null == servid
          ? _value.servid
          : servid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcceptImpl implements Accept {
  const _$AcceptImpl({required this.servid});

  @override
  final String servid;

  @override
  String toString() {
    return 'AfteAcceptRejectEvent.accept(servid: $servid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptImpl &&
            (identical(other.servid, servid) || other.servid == servid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, servid);

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      __$$AcceptImplCopyWithImpl<_$AcceptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String servid) accept,
    required TResult Function(String servid) reject,
    required TResult Function() reset,
  }) {
    return accept(servid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String servid)? accept,
    TResult? Function(String servid)? reject,
    TResult? Function()? reset,
  }) {
    return accept?.call(servid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String servid)? accept,
    TResult Function(String servid)? reject,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(servid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Accept value) accept,
    required TResult Function(Reject value) reject,
    required TResult Function(Reset value) reset,
  }) {
    return accept(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Accept value)? accept,
    TResult? Function(Reject value)? reject,
    TResult? Function(Reset value)? reset,
  }) {
    return accept?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Accept value)? accept,
    TResult Function(Reject value)? reject,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(this);
    }
    return orElse();
  }
}

abstract class Accept implements AfteAcceptRejectEvent {
  const factory Accept({required final String servid}) = _$AcceptImpl;

  String get servid;

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectImplCopyWith<$Res> {
  factory _$$RejectImplCopyWith(
          _$RejectImpl value, $Res Function(_$RejectImpl) then) =
      __$$RejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String servid});
}

/// @nodoc
class __$$RejectImplCopyWithImpl<$Res>
    extends _$AfteAcceptRejectEventCopyWithImpl<$Res, _$RejectImpl>
    implements _$$RejectImplCopyWith<$Res> {
  __$$RejectImplCopyWithImpl(
      _$RejectImpl _value, $Res Function(_$RejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servid = null,
  }) {
    return _then(_$RejectImpl(
      servid: null == servid
          ? _value.servid
          : servid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectImpl implements Reject {
  const _$RejectImpl({required this.servid});

  @override
  final String servid;

  @override
  String toString() {
    return 'AfteAcceptRejectEvent.reject(servid: $servid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectImpl &&
            (identical(other.servid, servid) || other.servid == servid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, servid);

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      __$$RejectImplCopyWithImpl<_$RejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String servid) accept,
    required TResult Function(String servid) reject,
    required TResult Function() reset,
  }) {
    return reject(servid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String servid)? accept,
    TResult? Function(String servid)? reject,
    TResult? Function()? reset,
  }) {
    return reject?.call(servid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String servid)? accept,
    TResult Function(String servid)? reject,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(servid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Accept value) accept,
    required TResult Function(Reject value) reject,
    required TResult Function(Reset value) reset,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Accept value)? accept,
    TResult? Function(Reject value)? reject,
    TResult? Function(Reset value)? reset,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Accept value)? accept,
    TResult Function(Reject value)? reject,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class Reject implements AfteAcceptRejectEvent {
  const factory Reject({required final String servid}) = _$RejectImpl;

  String get servid;

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$AfteAcceptRejectEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of AfteAcceptRejectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'AfteAcceptRejectEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String servid) accept,
    required TResult Function(String servid) reject,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String servid)? accept,
    TResult? Function(String servid)? reject,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String servid)? accept,
    TResult Function(String servid)? reject,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Accept value) accept,
    required TResult Function(Reject value) reject,
    required TResult Function(Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Accept value)? accept,
    TResult? Function(Reject value)? reject,
    TResult? Function(Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Accept value)? accept,
    TResult Function(Reject value)? reject,
    TResult Function(Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements AfteAcceptRejectEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$AfteAcceptRejectState {
  AfteAcceptServices get service => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;

  /// Create a copy of AfteAcceptRejectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AfteAcceptRejectStateCopyWith<AfteAcceptRejectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AfteAcceptRejectStateCopyWith<$Res> {
  factory $AfteAcceptRejectStateCopyWith(AfteAcceptRejectState value,
          $Res Function(AfteAcceptRejectState) then) =
      _$AfteAcceptRejectStateCopyWithImpl<$Res, AfteAcceptRejectState>;
  @useResult
  $Res call({AfteAcceptServices service, bool isLoading, bool isFailure});
}

/// @nodoc
class _$AfteAcceptRejectStateCopyWithImpl<$Res,
        $Val extends AfteAcceptRejectState>
    implements $AfteAcceptRejectStateCopyWith<$Res> {
  _$AfteAcceptRejectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AfteAcceptRejectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? isLoading = null,
    Object? isFailure = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AfteAcceptServices,
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
abstract class _$$AfteAcceptRejectStateImplCopyWith<$Res>
    implements $AfteAcceptRejectStateCopyWith<$Res> {
  factory _$$AfteAcceptRejectStateImplCopyWith(
          _$AfteAcceptRejectStateImpl value,
          $Res Function(_$AfteAcceptRejectStateImpl) then) =
      __$$AfteAcceptRejectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AfteAcceptServices service, bool isLoading, bool isFailure});
}

/// @nodoc
class __$$AfteAcceptRejectStateImplCopyWithImpl<$Res>
    extends _$AfteAcceptRejectStateCopyWithImpl<$Res,
        _$AfteAcceptRejectStateImpl>
    implements _$$AfteAcceptRejectStateImplCopyWith<$Res> {
  __$$AfteAcceptRejectStateImplCopyWithImpl(_$AfteAcceptRejectStateImpl _value,
      $Res Function(_$AfteAcceptRejectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AfteAcceptRejectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? isLoading = null,
    Object? isFailure = null,
  }) {
    return _then(_$AfteAcceptRejectStateImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AfteAcceptServices,
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

class _$AfteAcceptRejectStateImpl implements _AfteAcceptRejectState {
  const _$AfteAcceptRejectStateImpl(
      {required this.service,
      required this.isLoading,
      required this.isFailure});

  @override
  final AfteAcceptServices service;
  @override
  final bool isLoading;
  @override
  final bool isFailure;

  @override
  String toString() {
    return 'AfteAcceptRejectState(service: $service, isLoading: $isLoading, isFailure: $isFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AfteAcceptRejectStateImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service, isLoading, isFailure);

  /// Create a copy of AfteAcceptRejectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AfteAcceptRejectStateImplCopyWith<_$AfteAcceptRejectStateImpl>
      get copyWith => __$$AfteAcceptRejectStateImplCopyWithImpl<
          _$AfteAcceptRejectStateImpl>(this, _$identity);
}

abstract class _AfteAcceptRejectState implements AfteAcceptRejectState {
  const factory _AfteAcceptRejectState(
      {required final AfteAcceptServices service,
      required final bool isLoading,
      required final bool isFailure}) = _$AfteAcceptRejectStateImpl;

  @override
  AfteAcceptServices get service;
  @override
  bool get isLoading;
  @override
  bool get isFailure;

  /// Create a copy of AfteAcceptRejectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AfteAcceptRejectStateImplCopyWith<_$AfteAcceptRejectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
