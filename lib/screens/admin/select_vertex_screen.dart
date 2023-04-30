import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/area_model.dart';
import '../../models/admin_info.dart';
import '../../models/picture_size_model.dart';
import '../actions/actions.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/building_widgets.dart';
import '../widgets/figures/circle.dart';

import 'dart:async';

import '../widgets/transformation/matrix_gesture_detector.dart';

class SelectVertexScreen extends StatefulWidget {
  final Area area;
  SelectVertexScreen({super.key, required this.area});

  @override
  State<StatefulWidget> createState() => _SelectVertexScreenState();
}

class _SelectVertexScreenState extends State<SelectVertexScreen> {
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _calculateDimension());
  }

  Future _calculateDimension() async {
    //await outputPoints(widget.expanderKey, widget.area.imagePath);
    _setWidgets(context);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(AdminInfo.area.title, context),
      body: Column(children: [
        Expanded(
          key: expanderKey,
          child: MatrixGestureDetector(
            onMatrixUpdate: (m, tm, sm, rm) {
              notifier.value = m;
            },
            onScaleStart: () {
              var x_ = notifier.value.entry(0, 3);
              var y_ = notifier.value.entry(1, 3);
              var rX = roundDouble(x_);
              var rY = roundDouble(y_);
              if (kDebugMode) {
                print("picture angle:   x = $rX y = $rY");
              }
            },
            onScaleEnd: () { },
            child: GestureDetector(
              onTapUp: (TapUpDetails details) async {
                AdminInfo.area.vertexes?.add(await getCreatedVertexOnMap(details, widget.area, expanderKey));
                setState(() async {
                  await _setWidgets(context);
                });
              },
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
      ],
      ),
    );
  }

  Future<void> _setWidgets(BuildContext context) async {
    var pictureSize = await getPictureSizes(expanderKey, AdminInfo.area.imagePath);
    _setMap();
    _setPoints(context, pictureSize);
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(widget.area.imagePath),
    ));
  }

  void _setPoints(BuildContext context, PictureSize pictureSize){
    for(int i = 0; i < widget.area.vertexes!.length; ++i){
      //points.add(getSecondVertexAsButtonOnSecondArea(vertex: widget.area.vertexes![i], context: context, pictureSize: pictureSize));
    }
  }
}



