

import 'package:flutter/material.dart';
import '../../data/globals.dart';
import '../../models/admin_info.dart';
import '../../models/area_model.dart';
import '../../models/vertex_model.dart';
import '../actions/actions.dart';
import '../widgets/building_widgets.dart';
import '../widgets/figures/circle.dart';
import '../widgets/figures/line.dart';
import '../widgets/global/appBars.dart';
import '../widgets/matrix_gesture_detector.dart';

import 'add_area_screen.dart';
import 'add_vertex.dart';
import 'add_vertex_connection.dart';

class AddVertexesToAreaScreen extends StatefulWidget {
  AddVertexesToAreaScreen({super.key}){

    mapImage = Container(
      key: image_key,
      child: getAreaImage(AdminInfo.area.imagePath),
    );
  }
  late List<Widget> points = [mapImage];
  late Widget mapImage;
  GlobalKey image_key = GlobalKey();
  @override
  State<StatefulWidget> createState() => _AddVertexesToAreaScreenState();
}

class _AddVertexesToAreaScreenState extends State<AddVertexesToAreaScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setSize(widget.image_key);
      setPoints(widget, setStateAnalog);
      setState(() { });
    });
  }

  void setStateAnalog(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarWithIcon(AdminInfo.area.title, () => {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => AddAreaScreen(isCreate: false)))
        }, icon: Icons.edit),
        body:Column(children: [ Expanded(child: MatrixGestureDetector(
          onMatrixUpdate: (m, tm, sm, rm) {
            notifier.value = m;
          },
          onScaleStart: () {
            var x_ = notifier.value.entry(0, 3);
            var y_ = notifier.value.entry(1, 3);
            var rX = roundDouble(x_);
            var rY = roundDouble(y_);
            print("picture angle:   x = ${rX} y = ${rY}");
          },
          onScaleEnd: () {
            //print(notifier.value);
          },
          child: GestureDetector(
            onTapUp: (TapUpDetails details) {
              AdminInfo.area.vertexes?.add(getCreatedVertexOnMap(details));
              setState(() {
                setPoints(widget, setStateAnalog);
              });
            },
            child: AnimatedBuilder(
              animation: notifier,
              builder: (ctx, child) {
                return Transform(
                  transform: notifier.value,
                  child: Stack(
                    children: widget.points,
                  ),
                );
              },
            ),
          ),
        ),),
          Padding(padding: EdgeInsets.only(left: 20, right: 20), child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("First: ${AdminInfo.selectedVertex?.title ?? "none"}", style: TextStyle(fontSize: 20),),
              Text("Second: ${AdminInfo.secondSelectedVertex?.title ?? "none"}", style: TextStyle(fontSize: 20),),
            ]),),
          Padding(padding: EdgeInsets.only(left: 20, right: 20), child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
              width: 100,
              child: ElevatedButton(
                child: Text("Join"),
                onPressed: (){
                  bool isCreate = true;
                  AdminInfo.clearConnection();
                  if(AdminInfo.selectedVertex!.vertexConnections!.any((x) => x.nextVertex.uid == AdminInfo.secondSelectedVertex!.uid)){
                    AdminInfo.connection = AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x) => x.nextVertex.uid == AdminInfo.secondSelectedVertex!.uid);
                    isCreate = false;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddVertexConnectionScreen(isCreate: isCreate)));
                },
              ), ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    child: Text("Delete"),
                    onPressed: (){
                      DeleteSelected(widget, setStateAnalog);
                    },
                  ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  child: Text("Edit"),
                  style: ElevatedButton.styleFrom(),
                  onPressed: (){
                    if(AdminInfo.selectedVertex != null){
                      //AdminInfo.vertex = AdminInfo.selectedVertex!;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddVertexScreen()));
                    }
                  },
                ),
              )
            ],),
            ),
          ],
        ),
    );
  }
}

void drowLine(Vertex first, Vertex second, List<Widget> points){
  double x1 = first.pointX!;
  double y1 = first.pointY!;
  double x2 = second.pointX!;
  double y2 = second.pointY!;
  double xDif = (first.pointX! - second.pointX!).abs() / 2;
  double yDif = (first.pointY! - second.pointY!).abs() / 2;
  double x2Res = 0;
  double y2Res = 0;
  if(x1 < x2){
    if(y1 < y2){
      x2Res = x1 + xDif;
      y2Res = y1 + yDif;
    }
    else{
      x2Res = x1 + xDif;
      y2Res = y1 - yDif;
    }
  }
  else{
    if(y1 < y2){
      x2Res = x1 - xDif;
      y2Res = y1 + yDif;
    }
    else{
      x2Res = x1 - xDif;
      y2Res = y1 - yDif;
    }
  }

  points.add(CustomPaint(
    foregroundPainter: Line(x1,
        y1,
        x2Res,
        y2Res),
    child: Container(
      color: Colors.transparent,
    ),
  ));
}

void DeleteSelected(AddVertexesToAreaScreen widget, Function func){
  AdminInfo.area.vertexes?.removeWhere((x) => x.uid == AdminInfo.selectedVertex?.uid);
  widget.points = [widget.mapImage];
  setPoints(widget, func);
  AdminInfo.clearSelectedVertexes();
  func();
}

void setPoints(AddVertexesToAreaScreen widget, Function func){
  for(int i = 0; i < AdminInfo.area.vertexes!.length; ++i){
    for(int j = 0; j < AdminInfo.area.vertexes![i].vertexConnections!.length; ++j){
      //
      // if якщо на одній зоні
      //
      if((AdminInfo.area.vertexes![i].isAreaConnection
      && AdminInfo.area.vertexes![i].vertexConnections![j].nextVertex.isAreaConnection) == false){
        drowLine(AdminInfo.area.vertexes![i],
            AdminInfo.area.vertexes![i].vertexConnections![j].nextVertex, widget.points);
      }

      //
      // інакше пофарбувати в жовтий
      //
    }
  }

  for(int i = 0; i < AdminInfo.area.vertexes!.length; ++i){
    widget.points.add(getVertexAsButtonOn2DMap(AdminInfo.area.vertexes![i], func));
  }
}
