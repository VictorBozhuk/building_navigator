import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import 'package:provider/provider.dart';
import '../../models/area_model.dart';
import '../../models/picture_size_model.dart';
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

import '../widgets/indicators/background_indicator.dart';
import '../widgets/paddings/main_padding.dart';
import '../widgets/transformation/matrix_gesture_detector.dart';
import '../widgets/transformation/transform_detector.dart';
import 'add_area_screen.dart';
import 'add_vertex_screen.dart';
import 'dart:async';

class AreaAdminScreen extends StatefulWidget {
  late Area area;
  late bool isSelectAreaConnection;
  AreaAdminScreen({super.key, required this.area, this.isSelectAreaConnection = false});

  @override
  State<StatefulWidget> createState() => _AreaAdminScreenState();
}

class _AreaAdminScreenState extends State<AreaAdminScreen> {
  late VertexesProvider vertexProvider;
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  PictureSize imageSize = PictureSize.empty();
  @override
  void initState() {
    super.initState();
    AdminInfo.clearSelectedVertexes();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
      //await _calculateDimension();
    });
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
            onTap: () => Navi.pushThenAction(context, AddAreaScreen(area: widget.area), action: () => setState(() {})),
            icon: Icons.edit),
        body: Column(children: [
          Expanded(
            key: expanderKey,
            child: TransformDetector(notifier,
              onTap: onAreaTap,
              shouldRotate: false,
              child: Stack(children: points,),
            ),
          ),
          if(!widget.isSelectAreaConnection)
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
                    Text("Length: ${getLengthByPixels(vertexProvider.firstSelected, vertexProvider.secondSelected, imageSize)}",
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

          if(!widget.isSelectAreaConnection)
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

  void setStateAnalog(){
    setState(() {});
  }

  Future _calculateDimension() async {
    await _setWidgets(_calculateDimension);
    setState(() { });
  }

  Future<void> calculateDimensionOnForAreaConnection() {
    return _setWidgets(naviToAddVertexFromAreaConnection);
  }

  Future<void> naviToAddVertexFromAreaConnection() async {
    vertexProvider.firstSelected!.areaConnectionId = widget.area.id;
    //vertexProvider.firstSelected!.areaConnection = widget.area;
    if(vertexProvider.firstSelected!.vertexConnections
        .any((vc) => vc.nextVertex!.areaId != vertexProvider.firstSelected!.areaId) == true){
      vertexProvider.connection = vertexProvider.firstSelected!.vertexConnections
          .firstWhere((vc) => vc.nextVertex!.areaId != vertexProvider.firstSelected!.areaId);
    } else{
      vertexProvider.connection = VertexConnection.empty(vertexProvider.firstSelected!.id, vertexProvider.differentAreaVertexSelected!.id);
      vertexProvider.connection!.nextVertex = vertexProvider.differentAreaVertexSelected!;
    }

    Navi.pushReplacement(context, PanoramaVertexAdminScreen(
      area: vertexProvider.area,
      first: vertexProvider.firstSelected!,
      second: vertexProvider.differentAreaVertexSelected!,
      connection: vertexProvider.connection!,
    ));
  }

  Future<bool> getData() async {
    //vertexes = await vertexProvider.getAll(widget.area);

    if(widget.isSelectAreaConnection){
      vertexProvider.firstSelected!.areaConnection = widget.area;
      await calculateDimensionOnForAreaConnection();
      setState(() { });
      return true;
    }

    await _calculateDimension();
    return true;
  }

  Future<void> onRightArrow() async {
    if(vertexProvider.firstSelected != null){
      vertexProvider.firstSelected!.pointX = vertexProvider.firstSelected!.pointX + 1;
      await vertexProvider.addOrUpdate(vertexProvider.firstSelected!, widget.area);
      await _calculateDimension();
    }
  }

  Future<void> onLeftArrow() async {
    vertexProvider.firstSelected!.pointX = vertexProvider.firstSelected!.pointX - 1;
    await vertexProvider.addOrUpdate(vertexProvider.firstSelected!, widget.area);
    await _calculateDimension();
  }

  Future<void> onTopArrow() async {
    vertexProvider.firstSelected!.pointY = vertexProvider.firstSelected!.pointY - 1;
    await vertexProvider.addOrUpdate(vertexProvider.firstSelected!, widget.area);
    await _calculateDimension();
  }

  Future<void> onBottomArrow() async {
    vertexProvider.firstSelected!.pointY = vertexProvider.firstSelected!.pointY + 1;
    await vertexProvider.addOrUpdate(vertexProvider.firstSelected!, widget.area);
    await _calculateDimension();
  }

  void onEdit(){
    if(vertexProvider.firstSelected != null){
      vertexProvider.area = widget.area;
      //AdminInfo.vertex = AdminInfo.selectedVertex!;
      Navi.push(context, AddVertexScreen(area: widget.area, vertex: vertexProvider.firstSelected!));
    }
  }

  void onJoin(){
    //
    // check if vertex is not red
    //
    if(vertexProvider.isJoinPossible()){
      Navi.pushThenFutureAction(context,
        PanoramaVertexAdminScreen(
          area: widget.area,
          first: vertexProvider.firstSelected!,
          second: vertexProvider.secondSelected!,
          connection: vertexProvider.getConnection(),
        ),
        action: _calculateDimension
      );
    }
  }

  Future<void> onAreaTap(TapUpDetails details) async {
    if(!widget.isSelectAreaConnection){
      var vertex = await getCreatedVertexOnMap(details, widget.area, expanderKey);
      widget.area.vertexes.add(vertex);
      await vertexProvider.addOrUpdate(vertex, widget.area);
      await _setWidgets(_calculateDimension);
      setState(() { });
    }
  }

  Future<void> onDelete() async {
    await vertexProvider.delete(vertexProvider.firstSelected!, widget.area);
    widget.area.vertexes.remove(vertexProvider.firstSelected!);
    await _setWidgets(_calculateDimension);
    setStateAnalog();
  }

  Future<void> _setWidgets(Future Function() func) async {
    imageSize = await getPictureSizes(expanderKey, widget.area.imagePath);
    points.clear();
    _setMap();
    _setLines(imageSize);
    _setPoints(func, imageSize);
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(widget.area.imagePath),
    ));
  }

  Future _setLines(PictureSize pictureSize) async {
    for(var v in widget.area.vertexes){
      for(var vc in v.vertexConnections){
        if(widget.area.vertexes.any((v) => v.id == vc.nextVertexId)){
          var next = widget.area.vertexes.firstWhere((v) => v.id == vc.nextVertexId);
          points.add(drawLine(v, next, pictureSize));
        }
      }
    }
  }

  void _setPoints(Future Function() func, PictureSize pictureSize){
    for(var v in widget.area.vertexes){
      points.add(getVertexAsButtonOn2DMap(
          vertex: v,
          func: func,
          pictureSize: pictureSize,
          radius: widget.area.vertexRadius,
          vertexProvider: vertexProvider,
          isAreaConnection: widget.isSelectAreaConnection));
    }
  }
}


