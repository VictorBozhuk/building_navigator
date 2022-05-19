part of 'buildings_bloc.dart';

@freezed
class BuildingsEvent with _$BuildingsEvent {
  const factory BuildingsEvent.load() = LoadBuildings;
}
