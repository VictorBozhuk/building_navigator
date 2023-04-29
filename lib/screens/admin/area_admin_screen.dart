import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import 'package:provider/provider.dart';
import '../../models/area_model.dart';
import '../../models/picture_size_model.dart';
import '../../navigation/app_router.gr.dart';
import '../../navigation/navi.dart';
import '../../providers/areas_provider.dart';
import '../../providers/vertexes_provider.dart';
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

class AreaAdminScreen extends StatefulWidget {
  late Area area;
  AreaAdminScreen({super.key, required this.area});

  @override
  State<StatefulWidget> createState() => _AreaAdminScreenState();
}

class _AreaAdminScreenState extends State<AreaAdminScreen> {
  late VertexesProvider vertexProvider;
  late List<Vertex> vertexes;
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
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
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    vertexProvider = Provider.of<VertexesProvider>(context);
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
        backgroundColor: AppTheme.imageBackground,
        appBar: getAppBarWithIcon(
            widget.area.title,
            context,
            onTap: () => Navi.push(context, AddAreaRoute(area: widget.area)),
            icon: Icons.edit),
        body: Column(children: [
          Expanded(
            key: expanderKey,
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
              onScaleStart: () { },
              onScaleEnd: () { },
              child: GestureDetector(
                onTapUp: onAreaTap,
                child: AnimatedBuilder(
                  animation: notifier,
                  builder: (ctx, child) {
                    return Transform(
                      transform: notifier.value,
                      child: Stack(
                        children: points,
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
                  Text("First: ${vertexProvider.firstSelected?.title ?? "none"}",
                      style: textStyleMainNormalTextBlack),
                  Text("Second: ${vertexProvider.secondSelected?.title ?? "none"}",
                      style: textStyleMainNormalTextBlack),
                  Text("Length: ${getLengthByPixels(vertexProvider.firstSelected, vertexProvider.secondSelected, widget.area.imageSize)}",
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
                  onPressed: onJoin
                ),
                MainComponentButton(
                  title: "Delete",
                  onPressed: onDelete
                ),
                MainComponentButton(
                    title: "Edit",
                    onPressed: onEdit
                ),
              ],),
            ),
          ],
        ),
    );
  }

  Future<void> onRightArrow() async {
    vertexProvider.firstSelected!.pointX
    = vertexProvider.firstSelected!.pointX + 1;
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  Future<void> onLeftArrow() async {
    vertexProvider.firstSelected!.pointX
    = vertexProvider.firstSelected!.pointX - 1;
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  Future<void> onTopArrow() async {
    vertexProvider.firstSelected!.pointY
    = vertexProvider.firstSelected!.pointY - 1;
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  Future<void> onBottomArrow() async {
    vertexProvider.firstSelected!.pointY
    = vertexProvider.firstSelected!.pointY + 1;
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  void onEdit(){
    if(vertexProvider.firstSelected != null){
      //AdminInfo.vertex = AdminInfo.selectedVertex!;
      Navi.push(context, AddVertexRoute(area: widget.area, vertex: vertexProvider.firstSelected!));
    }
  }

  void onJoin(){
    //
    // check if vertex is not red
    //
    if(vertexProvider.setConnection()){
      Navi.push(context, PanoramaVertexAdminRoute(
        area: widget.area,
        first: vertexProvider.firstSelected!,
        second: vertexProvider.secondSelected!,
        connection: vertexProvider.connection!,
      ));
    }
  }

  Future<void> onAreaTap(TapUpDetails details) async {
    var vertex = await getCreatedVertexOnMap(details, widget.area, expanderKey);
    vertexes.add(vertex);
    await vertexProvider.addOrUpdate(vertex, widget.area);
    await _setWidgets(setStateAnalog);
    setState(() { });
  }

  Future<void> onDelete() async {
    await vertexProvider.delete(vertexProvider.firstSelected!, widget.area);
    await _setWidgets(setStateAnalog);
    setStateAnalog();
  }

  Future<void> _setWidgets(Function func) async {
    widget.area.imageSize = await getPictureSizes(expanderKey, widget.area.imagePath);
    points.clear();
    _setMap();
    _setLines(widget.area.imageSize);
    _setPoints(func, widget.area.imageSize);
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(widget.area.imagePath),
    ));
  }

  Future _setLines(PictureSize pictureSize) async {
    for(var v in widget.area.vertexes){
      for(var vc in v.vertexConnections!){
        if((v.areaConnection != null
            && vc.nextVertex?.areaConnection != null) == false){
          points.add(drawLine(v, vc.nextVertex!, pictureSize));
        }
      }
    }
  }

  void _setPoints(Function func, PictureSize pictureSize){
    for(var v in widget.area.vertexes){
      if(widget.area.title == "1 floor"){
        points.add(getVertexAsButtonOn2DMap(v, func, pictureSize, radius: widget.area.vertexRadius));
      } else{
        points.add(getVertexAsButtonOn2DMap(v, func, pictureSize));
      }
    }
  }
}


