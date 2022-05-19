// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'buildings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BuildingsStateTearOff {
  const _$BuildingsStateTearOff();

  _BuildingsState call(
      {BuildingsStatus status = BuildingsStatus.loading,
      List<Building> buildings = const [],
      String? errorMessage}) {
    return _BuildingsState(
      status: status,
      buildings: buildings,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $BuildingsState = _$BuildingsStateTearOff();

/// @nodoc
mixin _$BuildingsState {
  BuildingsStatus get status => throw _privateConstructorUsedError;
  List<Building> get buildings => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildingsStateCopyWith<BuildingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingsStateCopyWith<$Res> {
  factory $BuildingsStateCopyWith(
          BuildingsState value, $Res Function(BuildingsState) then) =
      _$BuildingsStateCopyWithImpl<$Res>;
  $Res call(
      {BuildingsStatus status, List<Building> buildings, String? errorMessage});
}

/// @nodoc
class _$BuildingsStateCopyWithImpl<$Res>
    implements $BuildingsStateCopyWith<$Res> {
  _$BuildingsStateCopyWithImpl(this._value, this._then);

  final BuildingsState _value;
  // ignore: unused_field
  final $Res Function(BuildingsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? buildings = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingsStatus,
      buildings: buildings == freezed
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<Building>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BuildingsStateCopyWith<$Res>
    implements $BuildingsStateCopyWith<$Res> {
  factory _$BuildingsStateCopyWith(
          _BuildingsState value, $Res Function(_BuildingsState) then) =
      __$BuildingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildingsStatus status, List<Building> buildings, String? errorMessage});
}

/// @nodoc
class __$BuildingsStateCopyWithImpl<$Res>
    extends _$BuildingsStateCopyWithImpl<$Res>
    implements _$BuildingsStateCopyWith<$Res> {
  __$BuildingsStateCopyWithImpl(
      _BuildingsState _value, $Res Function(_BuildingsState) _then)
      : super(_value, (v) => _then(v as _BuildingsState));

  @override
  _BuildingsState get _value => super._value as _BuildingsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? buildings = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_BuildingsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingsStatus,
      buildings: buildings == freezed
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<Building>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BuildingsState implements _BuildingsState {
  const _$_BuildingsState(
      {this.status = BuildingsStatus.loading,
      this.buildings = const [],
      this.errorMessage});

  @JsonKey(defaultValue: BuildingsStatus.loading)
  @override
  final BuildingsStatus status;
  @JsonKey(defaultValue: const [])
  @override
  final List<Building> buildings;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BuildingsState(status: $status, buildings: $buildings, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuildingsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.buildings, buildings) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(buildings), errorMessage);

  @JsonKey(ignore: true)
  @override
  _$BuildingsStateCopyWith<_BuildingsState> get copyWith =>
      __$BuildingsStateCopyWithImpl<_BuildingsState>(this, _$identity);
}

abstract class _BuildingsState implements BuildingsState {
  const factory _BuildingsState(
      {BuildingsStatus status,
      List<Building> buildings,
      String? errorMessage}) = _$_BuildingsState;

  @override
  BuildingsStatus get status;
  @override
  List<Building> get buildings;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$BuildingsStateCopyWith<_BuildingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BuildingsEventTearOff {
  const _$BuildingsEventTearOff();

  LoadBuildings load() {
    return const LoadBuildings();
  }
}

/// @nodoc
const $BuildingsEvent = _$BuildingsEventTearOff();

/// @nodoc
mixin _$BuildingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBuildings value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadBuildings value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBuildings value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingsEventCopyWith<$Res> {
  factory $BuildingsEventCopyWith(
          BuildingsEvent value, $Res Function(BuildingsEvent) then) =
      _$BuildingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BuildingsEventCopyWithImpl<$Res>
    implements $BuildingsEventCopyWith<$Res> {
  _$BuildingsEventCopyWithImpl(this._value, this._then);

  final BuildingsEvent _value;
  // ignore: unused_field
  final $Res Function(BuildingsEvent) _then;
}

/// @nodoc
abstract class $LoadBuildingsCopyWith<$Res> {
  factory $LoadBuildingsCopyWith(
          LoadBuildings value, $Res Function(LoadBuildings) then) =
      _$LoadBuildingsCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadBuildingsCopyWithImpl<$Res>
    extends _$BuildingsEventCopyWithImpl<$Res>
    implements $LoadBuildingsCopyWith<$Res> {
  _$LoadBuildingsCopyWithImpl(
      LoadBuildings _value, $Res Function(LoadBuildings) _then)
      : super(_value, (v) => _then(v as LoadBuildings));

  @override
  LoadBuildings get _value => super._value as LoadBuildings;
}

/// @nodoc

class _$LoadBuildings implements LoadBuildings {
  const _$LoadBuildings();

  @override
  String toString() {
    return 'BuildingsEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadBuildings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBuildings value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadBuildings value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBuildings value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadBuildings implements BuildingsEvent {
  const factory LoadBuildings() = _$LoadBuildings;
}
