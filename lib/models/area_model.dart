import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Area {
  late String uid;
  late String title;
  late String imagePath;
  late List<Vertex>? vertexes = [];

  Area(this.title, this.imagePath, {this.vertexes}){
    uid = const Uuid().v1();
  }
  Area.copy(this.uid, this.title, this.imagePath, {this.vertexes});

  Area.createEmpty(){
    uid = const Uuid().v1();
    title = '';
    imagePath = '';
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "title": title,
      "imagePath": imagePath,
      "vertexes": vertexes?.map((w) => w.toMap()).toList(),
    };
  }

  Area.fromJson(Map<String, dynamic> data) {
    uid = data['uid'];
    title = data['title'];
    imagePath = data['imagePath'];
    if(data['vertexes'] == null){
      vertexes = [];
    } else{
      vertexes = (data['vertexes'] as List).map((w) => Vertex.fromJson(w)).toList();
    }
  }

  Area copy(){
    var copiedVertexes = vertexes?.map((w) => w.copy()).toList();
    return Area.copy(uid, title, imagePath,vertexes: copiedVertexes);
  }
}