import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/building_model.dart';

part 'buildings_state.dart';
part 'buildings_event.dart';
part 'buildings_bloc.freezed.dart';

class BuildingsBloc extends Bloc<BuildingsEvent, BuildingsState> {
  BuildingsBloc() : super(BuildingsState()) {
    on<LoadBuildings>(_loadBuildings);
  }

  //final TransferProvider transferProvider;
  //late MusConvPlaylist musConvPlaylist;

  Future _loadBuildings(LoadBuildings event, Emitter<BuildingsState> emit) async {
    emit(state.copyWith(status: BuildingsStatus.loading));

    try {
      List<Building> buildings = [
        //new Building("LNU Dormitory 3", 'assets/buildings/dormitory_3.jpg', []),
      ];

      emit(state.copyWith(
          status: BuildingsStatus.loaded,
          buildings: buildings)
      );
    }
    catch  (e) {
      emit(
          state.copyWith(
            status: BuildingsStatus.failure,
            errorMessage: e.toString(),
          ),);
    }


  }
}

