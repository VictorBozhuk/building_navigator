import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import '../../models/picture_size_model.dart';
import '../../styles/appTheme.dart';
import '../../styles/text_styles/text_styles.dart';
import '../../models/admin_info.dart';
import '../../models/vertex_model.dart';
import '../actions/actions.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/building_widgets.dart';
import '../widgets/buttons/arrow_button.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/buttons/small_button.dart';
import '../widgets/figures/circle.dart';
import '../widgets/figures/line.dart';

import '../widgets/paddings/main_padding.dart';
import '../widgets/transformation/matrix_gesture_detector.dart';
import 'add_area_screen.dart';
import 'add_vertex_screen.dart';
import 'dart:async';

class AddVertexesToAreaScreen extends StatefulWidget {
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  AddVertexesToAreaScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddVertexesToAreaScreenState();
}

class _AddVertexesToAreaScreenState extends State<AddVertexesToAreaScreen> {
  @override
  void initState() {
    super.initState();
    AdminInfo.clearSelectedVertexes();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _calculateDimension());
  }

  void setStateAnalog(){
    setState(() {});
  }

  Future _calculateDimension() async {
    //await outputPoints(widget.expanderKey, AdminInfo.area.imagePath);
    await _setWidgets(widget, setStateAnalog);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
        backgroundColor: AppTheme.imageBackground,
        appBar: getAppBarWithIcon(
            AdminInfo.area.title,
            context,
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) => const AddAreaScreen(isCreate: false)))
        }, icon: Icons.edit),
        body: Column(children: [
          Expanded(
            key: widget.expanderKey,
            child: MatrixGestureDetector(
              shouldRotate: false,
              onMatrixUpdate: (m, tm, sm, rm) {
                notifier.value = m;

                //notifier.value.setEntry(0, 3, 0);
                //notifier.value.setEntry(1, 3, 0);
                //notifier.value.setEntry(0, 0, 1);
                //notifier.value.setEntry(1, 1, 1);

                var x_ = notifier.value.entry(0, 3);
                var y_ = notifier.value.entry(1, 3);
                var s_ = notifier.value.entry(0, 0);
                var rX = roundDouble(x_);
                var rY = roundDouble(y_);
                var rS = roundDouble(s_);
                if (kDebugMode) {
                  print("coords:   x = $rX y = $rY s = $rS");
                }
              },
              onScaleStart: () {
                //var x_ = notifier.value.entry(0, 3);
                //var y_ = notifier.value.entry(1, 3);
                //var s_ = notifier.value.entry(0, 0);
                //var rX = roundDouble(x_);
                //var rY = roundDouble(y_);
                //var rS = roundDouble(s_);
                //if (kDebugMode) {
                //  print("coords:   x = $rX y = $rY s = $rS");
                //}
              },
              onScaleEnd: () { },
              child: GestureDetector(
                onTapUp: (TapUpDetails details) async {
                  AdminInfo.area.vertexes?.add(await getCreatedVertexOnMap(details, AdminInfo.area, widget.expanderKey));
                  await _setWidgets(widget, setStateAnalog);
                  setState(() { });
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
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            MainPadding(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First: ${AdminInfo.selectedVertex?.title ?? "none"}",
                      style: textStyleMainNormalTextBlack),
                  Text("Second: ${AdminInfo.secondSelectedVertex?.title ?? "none"}",
                      style: textStyleMainNormalTextBlack),
                  Text("Length: ${getLengthByPixels(AdminInfo.selectedVertex, AdminInfo.secondSelectedVertex, AdminInfo.pictureSize)}",
                      style: textStyleMainNormalTextBlack),
                ]),
            ),
            MainPadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ArrowButton(
                      icon: const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                      onPressed: onTopArrow
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ArrowButton(
                          icon: const RotatedBox(
                            quarterTurns: 0,
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                          onPressed: onLeftArrow
                      ),
                      const Padding(padding: EdgeInsets.only(left: 15, right: 15),),
                      ArrowButton(
                          icon: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                          onPressed: onRightArrow
                      )
                    ],
                  ),
                  ArrowButton(
                      icon: const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                      onPressed: onBottomArrow
                  ),
                ],),
            ),
          ]),
          MainPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainComponentButton(
                  title: "Join",
                  onPressed: onJoinVertex
                ),
                MainComponentButton(
                  title: "Delete",
                  onPressed: onDeleteVertex
                ),
                MainComponentButton(
                    title: "Edit",
                    onPressed: onEditVertex
                ),
              ],),
            ),
          ],
        ),
    );
  }

  Future<void> onRightArrow() async {
    AdminInfo.selectedVertex?.pointX
    = AdminInfo.selectedVertex!.pointX! + 1;
    await _setWidgets(widget, setStateAnalog);
    setState(() { });
  }

  Future<void> onLeftArrow() async {
    AdminInfo.selectedVertex?.pointX
    = AdminInfo.selectedVertex!.pointX! - 1;
    await _setWidgets(widget, setStateAnalog);
    setState(() { });
  }

  Future<void> onTopArrow() async {
    AdminInfo.selectedVertex?.pointY
    = AdminInfo.selectedVertex!.pointY! - 1;
    await _setWidgets(widget, setStateAnalog);
    setState(() { });
  }

  Future<void> onBottomArrow() async {
    AdminInfo.selectedVertex?.pointY
    = AdminInfo.selectedVertex!.pointY! + 1;
    await _setWidgets(widget, setStateAnalog);
    setState(() { });
  }

  void onEditVertex(){
    if(AdminInfo.selectedVertex != null){
      //AdminInfo.vertex = AdminInfo.selectedVertex!;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddVertexScreen()));
    }
  }

  Future<void> onDeleteVertex() async {
    await _deleteSelected(widget, setStateAnalog);
  }

  void onJoinVertex(){
    bool isCreate = true;
    AdminInfo.clearConnection();
    if(AdminInfo.selectedVertex!.vertexConnections!.any((x) => x.nextVertex.uid == AdminInfo.secondSelectedVertex!.uid)){
      AdminInfo.connection = AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x) => x.nextVertex.uid == AdminInfo.secondSelectedVertex!.uid);
      isCreate = false;
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PanoramaVertexAdminScreen(
          isCreate: isCreate,
          panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '',
          connection: AdminInfo.connection,
        )));
  }
}

void _drawLine(Vertex first, Vertex second, List<Widget> points, PictureSize pictureSize) {
  double x1 = pictureSize.width / (first.map2DWidth! / first.pointX!);
  double y1 = pictureSize.width / (first.map2DWidth! / first.pointY!);
  double x2 = pictureSize.width / (second.map2DWidth! / second.pointX!);
  double y2 = pictureSize.width / (second.map2DWidth! / second.pointY!);
  double xDif = (x1 - x2).abs() / 2;
  double yDif = (y1 - y2).abs() / 2;
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
    foregroundPainter: Line(x1, y1, x2Res, y2Res),
    child: Container(color: Colors.transparent),
  ));
}

Future<void> _deleteSelected(AddVertexesToAreaScreen widget, Function func) async {
  _deleteConnectionVertexOfNextVertexes();
  AdminInfo.area.vertexes?.removeWhere((x) => x.uid == AdminInfo.selectedVertex?.uid);
  await _setWidgets(widget, func);
  AdminInfo.clearSelectedVertexes();
  func();
}

void _deleteConnectionVertexOfNextVertexes(){
  _deleteAreaAndConnectionOfNextVertex();
  for(int i = 0; i < AdminInfo.area.vertexes!.length; ++i){
    for(int j = 0; j < (AdminInfo.area.vertexes?[i].vertexConnections?.length ?? 0); ++j){
      if(AdminInfo.area.vertexes?[i].vertexConnections?[j].nextVertex.uid == AdminInfo.selectedVertex?.uid){
        AdminInfo.area.vertexes?[i].vertexConnections?.remove(AdminInfo.area.vertexes?[i].vertexConnections?[j]);
      }
    }
  }
}

void _deleteAreaAndConnectionOfNextVertex(){
  if(AdminInfo.selectedVertex?.areaConnection != null){
    var nextArea = AdminInfo.building.areas.firstWhere((x) => x.uid == AdminInfo.selectedVertex?.areaConnection!.uid);
    for(int i = 0; i < nextArea.vertexes!.length; ++i){
      for(int j = 0; j < (nextArea.vertexes?[i].vertexConnections?.length ?? 0); ++j){
        if(nextArea.vertexes?[i].vertexConnections?[j].nextVertex.uid == AdminInfo.selectedVertex?.uid){
          nextArea.vertexes?[i].areaConnection = null;
          nextArea.vertexes?[i].vertexConnections?.remove(nextArea.vertexes?[i].vertexConnections?[j]);
        }
      }
    }
  }
}

Future<void> _setWidgets(AddVertexesToAreaScreen widget, Function func) async {
  var pictureSize = await getPictureSizes(widget.expanderKey, AdminInfo.area.imagePath);
  AdminInfo.pictureSize = pictureSize;
  widget.points = [];
  _setMap(widget);
  _setLines(widget, pictureSize);
  _setPoints(widget, func, pictureSize);
}

void _setMap(AddVertexesToAreaScreen widget){
  widget.points.add(Container(
    child: getAreaImage(AdminInfo.area.imagePath),
  ));
}

Future _setLines(AddVertexesToAreaScreen widget, PictureSize pictureSize) async {
  for(int i = 0; i < AdminInfo.area.vertexes!.length; ++i){
    for(int j = 0; j < AdminInfo.area.vertexes![i].vertexConnections!.length; ++j){
      if((AdminInfo.area.vertexes![i].areaConnection != null
          && AdminInfo.area.vertexes![i].vertexConnections![j]
              .nextVertex.areaConnection != null) == false){
        _drawLine(AdminInfo.area.vertexes![i],
            AdminInfo.area.vertexes![i].vertexConnections![j].nextVertex,
            widget.points,
            pictureSize);
      }
    }
  }
}

void _setPoints(AddVertexesToAreaScreen widget, Function func, PictureSize pictureSize){
  for(int i = 0; i < AdminInfo.area.vertexes!.length; ++i){
    widget.points.add(getVertexAsButtonOn2DMap(AdminInfo.area.vertexes![i], func, pictureSize, radius: AdminInfo.area.vertexRadius));
  }
}
