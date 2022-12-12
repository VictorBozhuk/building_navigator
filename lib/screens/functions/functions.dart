

import '../../models/building_model.dart';
import '../../models/room_model.dart';

List<Room> getRoomsOfBuildingByTitle(Building building, String title)
{
  List<Room> rooms = [];
  for (var x in building.areas) {
    x.vertexes?.forEach((c) {
      rooms.addAll(c.rooms?.where((v) =>
          v.title.toLowerCase().contains(title.toLowerCase())) ?? []);
    });
  }

  rooms.sort((a, b) => a.title.compareTo(b.title));
  return rooms;
}