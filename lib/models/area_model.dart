import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Area {
  late String id;
  late String title;
  late String imagePath;
  late int countOfPixelsInMeter = 0;
  late double vertexRadius = 3; //
  late List<Vertex>? vertexes = [];

  Area(this.title, this.imagePath, this.countOfPixelsInMeter, {this.vertexes}){
    id = const Uuid().v1();
  }
  Area.createMainCopy(this.id, this.title, this.imagePath, this.countOfPixelsInMeter);
  Area.copy(this.id, this.title, this.imagePath, this.countOfPixelsInMeter, {this.vertexes});

  Area.createEmpty(){
    id = const Uuid().v1();
    title = '';
    imagePath = '';
    countOfPixelsInMeter = 0;
  }

  Area getObject(){
    return Area.createMainCopy(id, title, imagePath, countOfPixelsInMeter);
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "imagePath": imagePath,
      "countOfPixelsInMeter" : countOfPixelsInMeter,
      "vertexes": vertexes?.map((w) => w.toMap()).toList(),
    };
  }

  Map<String, dynamic> toMapForConnection(){
    return {
      "id" : id,
      "title": title,
      "imagePath": imagePath,
      "countOfPixelsInMeter": countOfPixelsInMeter,
    };
  }

  Area.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    imagePath = data['imagePath'];
    countOfPixelsInMeter = data['countOfPixelsInMeter'] ?? 0;
    if(data['vertexes'] == null){
      vertexes = [];
    } else{
      vertexes = (data['vertexes'] as List).map((w) => Vertex.fromJson(w)).toList();
    }
  }

  Area.fromJsonForConnection(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    imagePath = data['imagePath'];
    countOfPixelsInMeter = data["countOfPixelsInMeter"] ?? 0;
    vertexes = [];
  }

  Area copy(){
    var copiedVertexes = vertexes?.map((w) => w.copy()).toList();
    return Area.copy(id, title, imagePath, countOfPixelsInMeter, vertexes: copiedVertexes);
  }
}