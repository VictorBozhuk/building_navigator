import 'package:flutter/material.dart';
import '../../data/globals.dart';
import '../../models/area_model.dart';
import '../actions/actions.dart';
import '../widgets/building_widgets.dart';
import '../widgets/figures/circle.dart';
import '../widgets/matrix_gesture_detector.dart';

class AddVertexesToAreaScreen extends StatefulWidget {
  late Area area;
  AddVertexesToAreaScreen(this.area, {super.key}){
    mapImage = Container(
      key: key_1,
      child: getAreaImage(area.imagePath),
    );
  }
  late List<Widget> points = [];
  late Widget mapImage;

  @override
  State<StatefulWidget> createState() => _AddVertexesToAreaScreenState();
}

class _AddVertexesToAreaScreenState extends State<AddVertexesToAreaScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setSize(key_1);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.points.isEmpty){
      widget.points.add(widget.mapImage);
      for(int i = 0; i < widget.area.vertexes!.length; ++i){
        widget.points.add(getVertexAsButtonOn2DMap(widget.area.vertexes![i]));
      }
    }
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(widget.area.title),
        ),
        body: MatrixGestureDetector(
          onMatrixUpdate: (m, tm, sm, rm) {
            notifier.value = m;
          },
          onScaleStart: () {
            var x_ = notifier.value.entry(0, 3);
            var y_ = notifier.value.entry(1, 3);
            var r_x = roundDouble(x_);
            var r_y = roundDouble(y_);
            print("picture angle:   x = ${r_x} y = ${r_y}");
          },
          onScaleEnd: () {
            //print(notifier.value);
          },
          child: GestureDetector(
            onTapUp: (TapUpDetails details) {
              widget.area.vertexes?.add(getCreatedVertexOnMap(details));
              setState(() {
                for(int i = 0; i < widget.area.vertexes!.length; ++i){
                  widget.points.add(getVertexAsButtonOn2DMap(widget.area.vertexes![i]));
                }
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
        )
    );
  }
}
