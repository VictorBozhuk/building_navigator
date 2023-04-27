import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Area {
  late String id;
  late String buildingId;
  late String title;
  late String imagePath;
  late int pixelsInMeter;
  late double vertexRadius;

  late List<Vertex> vertexes;

  Area(this.title, this.buildingId, this.imagePath, this.pixelsInMeter, this.vertexRadius, {required this.vertexes}){
    id = const Uuid().v1();
  }
  Area.copy(this.id, this.title, this.buildingId, this.imagePath, this.pixelsInMeter, this.vertexRadius);

  Area.empty(this.buildingId){
    id = const Uuid().v1();
    title = '';
    imagePath = '';
    pixelsInMeter = 0;
    vertexRadius = 3;
    vertexes = [];
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "imagePath": imagePath,
      "pixelsInMeter" : pixelsInMeter,
      //"vertexes": vertexes.map((w) => w.toMap()).toList(),
    };
  }

  Area.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    imagePath = data['imagePath'];
    pixelsInMeter = data['pixelsInMeter'];
    //if(data['vertexes'] == null){
    //  vertexes = [];
    //} else{
    //  vertexes = (data['vertexes'] as List).map((w) => Vertex.fromJson(w)).toList();
    //}
  }

  Area copy(){
    return Area.copy(id, title, buildingId, imagePath, pixelsInMeter, vertexRadius);
  }
}