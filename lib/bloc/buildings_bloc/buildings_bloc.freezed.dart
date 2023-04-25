// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buildings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$BuildingsStateCopyWithImpl<$Res, BuildingsState>;
  @useResult
  $Res call(
      {BuildingsStatus status, List<Building> buildings, String? errorMessage});
}

/// @nodoc
class _$BuildingsStateCopyWithImpl<$Res, $Val extends BuildingsState>
    implements $BuildingsStateCopyWith<$Res> {
  _$BuildingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buildings = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingsStatus,
      buildings: null == buildings
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<Building>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BuildingsStateCopyWith<$Res>
    implements $BuildingsStateCopyWith<$Res> {
  factory _$$_BuildingsStateCopyWith(
          _$_BuildingsState value, $Res Function(_$_BuildingsState) then) =
      __$$_BuildingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildingsStatus status, List<Building> buildings, String? errorMessage});
}

/// @nodoc
class __$$_BuildingsStateCopyWithImpl<$Res>
    extends _$BuildingsStateCopyWithImpl<$Res, _$_BuildingsState>
    implements _$$_BuildingsStateCopyWith<$Res> {
  __$$_BuildingsStateCopyWithImpl(
      _$_BuildingsState _value, $Res Function(_$_BuildingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buildings = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_BuildingsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingsStatus,
      buildings: null == buildings
          ? _value._buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<Building>,
      errorMessage: freezed == errorMessage
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
      final List<Building> buildings = const [],
      this.errorMessage})
      : _buildings = buildings;

  @override
  @JsonKey()
  final BuildingsStatus status;
  final List<Building> _buildings;
  @override
  @JsonKey()
  List<Building> get buildings {
    if (_buildings is EqualUnmodifiableListView) return _buildings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buildings);
  }

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
            other is _$_BuildingsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._buildings, _buildings) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_buildings), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuildingsStateCopyWith<_$_BuildingsState> get copyWith =>
      __$$_BuildingsStateCopyWithImpl<_$_BuildingsState>(this, _$identity);
}

abstract class _BuildingsState implements BuildingsState {
  const factory _BuildingsState(
      {final BuildingsStatus status,
      final List<Building> buildings,
      final String? errorMessage}) = _$_BuildingsState;

  @override
  BuildingsStatus get status;
  @override
  List<Building> get buildings;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_BuildingsStateCopyWith<_$_BuildingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BuildingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
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
    TResult? Function(LoadBuildings value)? load,
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
      _$BuildingsEventCopyWithImpl<$Res, BuildingsEvent>;
}

/// @nodoc
class _$BuildingsEventCopyWithImpl<$Res, $Val extends BuildingsEvent>
    implements $BuildingsEventCopyWith<$Res> {
  _$BuildingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadBuildingsCopyWith<$Res> {
  factory _$$LoadBuildingsCopyWith(
          _$LoadBuildings value, $Res Function(_$LoadBuildings) then) =
      __$$LoadBuildingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadBuildingsCopyWithImpl<$Res>
    extends _$BuildingsEventCopyWithImpl<$Res, _$LoadBuildings>
    implements _$$LoadBuildingsCopyWith<$Res> {
  __$$LoadBuildingsCopyWithImpl(
      _$LoadBuildings _value, $Res Function(_$LoadBuildings) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$LoadBuildings);
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
    TResult? Function()? load,
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
    TResult? Function(LoadBuildings value)? load,
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
