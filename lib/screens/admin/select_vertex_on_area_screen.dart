import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/area_model.dart';
import '../../models/admin_info.dart';
import '../actions/actions.dart';
import '../widgets/building_widgets.dart';
import '../widgets/figures/circle.dart';
import '../widgets/global/appBars.dart';
import '../widgets/matrix_gesture_detector.dart';

import 'dart:async';

class SelectVertexeOnAreaScreen extends StatefulWidget {
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  final Area area;
  SelectVertexeOnAreaScreen({super.key, required this.area});

  @override
  State<StatefulWidget> createState() => _SelectVertexeOnAreaScreenState();
}

class _SelectVertexeOnAreaScreenState extends State<SelectVertexeOnAreaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _calculateDimension());
  }

  Future _calculateDimension() async {
    await outputPoints(widget.expanderKey, widget.area.imagePath);
    _setWidgets(widget, context);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(AdminInfo.area.title),
      body: Column(children: [
        Expanded(
          key: widget.expanderKey,
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
              onTapUp: (TapUpDetails details) {
                AdminInfo.area.vertexes?.add(getCreatedVertexOnMap(details));
                setState(() {
                  _setWidgets(widget, context);
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
          ),
        ),
      ],
      ),
    );
  }
}


void _setWidgets(SelectVertexeOnAreaScreen widget, BuildContext context){
  _setMap(widget);
  _setPoints(widget, context);
}

void _setMap(SelectVertexeOnAreaScreen widget){
  widget.points.add(Container(
    child: getAreaImage(widget.area.imagePath),
  ));
}

void _setPoints(SelectVertexeOnAreaScreen widget, BuildContext context){
  for(int i = 0; i < widget.area.vertexes!.length; ++i){
    widget.points.add(getSecondVertexAsButtonOnSecondArea(widget.area.vertexes![i], context));
  }
}
