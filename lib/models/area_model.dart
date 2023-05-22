import 'package:lnu_navigator/models/picture_size_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Area {
  late String id;
  late String title;
  late String imagePath;
  late int pixelsInMeter;
  late double vertexRadius;

  late List<Vertex> vertexes;

  Area(this.title, this.imagePath, this.pixelsInMeter, this.vertexRadius){
    id = const Uuid().v1();
  }
  Area.copy(this.id, this.title, this.imagePath, this.pixelsInMeter, this.vertexRadius);

  Area.empty(){
    id = const Uuid().v1();
    title = '';
    imagePath = '';
    pixelsInMeter = 0;
    vertexRadius = 1.5;
    vertexes = [];
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "imagePath": imagePath,
      "pixelsInMeter" : pixelsInMeter,
      "vertexRadius" : vertexRadius,
    };
  }

  Area.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    imagePath = data['imagePath'];
    pixelsInMeter = data['pixelsInMeter'];
    vertexRadius = data['vertexRadius'];
  }

  Area copy(){
    return Area.copy(id, title, imagePath, pixelsInMeter, vertexRadius);
  }
}