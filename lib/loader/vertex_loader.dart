import '../../models/area_model.dart';
import '../../models/vertex_model.dart';
import '../../services/area_service.dart';
import '../../services/locator.dart';
import '../services/vertex_service.dart';

class Vertex7Loader {
  late Area area;
  Vertex7Loader(this.area);

  Future<void> addVertexes() async {
    await getIt<VertexService>().addOrUpdate(v7_6(), area);
    await getIt<VertexService>().addOrUpdate(v7(), area);
    await getIt<VertexService>().addOrUpdate(v701A(), area);
    await getIt<VertexService>().addOrUpdate(v714A(), area);
  }

  Vertex v7_6(){
    return Vertex.point(area.id, 91, 278, 393, 523)
      ..title="7-6"
      ..panoramaImagePath="https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6-7.jpg?alt=media&token=a9473f0d-ae4f-43cd-9ee6-effaa176c2b0";
  }

  Vertex v7() {
    return Vertex.point(area.id, 155, 267, 393, 523)
      ..title = "7"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F7.jpg?alt=media&token=77e15cca-1303-4e31-96a3-9bc7707e4071";
  }
  Vertex v701A() {
    return Vertex.point(area.id, 197, 267, 393, 523)
      ..title = "701A"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F701%D0%90.jpg?alt=media&token=3993d0e2-3501-4698-8990-ee5519baead2";
  }

  Vertex v714A() {
    return Vertex.point(area.id, 194, 204, 393, 523)
      ..title = "714A"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F714%D0%90.jpg?alt=media&token=c7552f75-5b66-45a1-b161-33bea4803df7";
  }
}


class Vertex6Loader {
  late Area area;
  Vertex6Loader(this.area);

  Future<void> addVertexes() async {
    await getIt<VertexService>().addOrUpdate(v6_7(), area);
    await getIt<VertexService>().addOrUpdate(v6(), area);
    await getIt<VertexService>().addOrUpdate(v601A(), area);
    await getIt<VertexService>().addOrUpdate(v614A(), area);
  }

  Vertex v6_7() {
    return Vertex.point(area.id, 93.5, 250, 393, 523)
      ..title = "6-7"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6-7.jpg?alt=media&token=a9473f0d-ae4f-43cd-9ee6-effaa176c2b0";
  }

  Vertex v6() {
    return Vertex.point(area.id, 155, 267, 393, 523)
      ..title = "6"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6%2F6.jpg?alt=media&token=207928e0-fb79-4290-bb5c-d9c1701675a4";
  }

  Vertex v601A() {
    return Vertex.point(area.id, 197, 267, 393, 523)
      ..title = "601A"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6%2F601%D0%90.jpg?alt=media&token=df75b9f6-9a7c-412d-ab67-10dbdc849b40";
  }

  Vertex v614A() {
    return Vertex.point(area.id, 194, 204, 393, 523)
      ..title = "614A"
      ..panoramaImagePath = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6%2F614%D0%90.jpg?alt=media&token=c791cc15-e2d8-42ca-93e6-587d62757cc9";
  }
}