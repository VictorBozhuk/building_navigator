part of 'buildings_bloc.dart';

enum BuildingsStatus {
  loading,
  loaded,
  failure,
}

@freezed
class BuildingsState with _$BuildingsState {
  const factory   BuildingsState({
    @Default(BuildingsStatus.loading) BuildingsStatus status,
    @Default([]) List<Building> buildings,
    String? errorMessage,
  }) = _BuildingsState;
}
