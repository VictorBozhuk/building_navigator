import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';
import 'package:lnu_navigator/screens/widgets/matrix_gesture_detector.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import 'list_rooms_screen.dart';

class AreaScreen extends StatefulWidget {
  AreaScreen({super.key}){
    _mapImage = Container(
      key: _imageKey,
      child: getAreaImage(UserInfo.area.imagePath),
    );
  }
  late List<Widget> points = [_mapImage];
  late Widget _mapImage;
  final GlobalKey _imageKey = GlobalKey();
  @override
  State<StatefulWidget> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  void setStateAnalog(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    if(PathInfo.isReadyToGo){
      _setPointsOfPath(widget, context, setStateAnalog);
    }else {
      _setPoints(widget, context, setStateAnalog);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(UserInfo.area.title),
      body: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        onScaleStart: () { },
        onScaleEnd: () { },
        child: Column(
            children: [
              Expanded(child:
                GestureDetector(onTapUp: (TapUpDetails details) { },
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
              ProfileItemButton(
                  title: 'Search for a room',
                  icon: const IconOfItemOnBuildingPage(),
                  func: () {
                    PathInfo.isWalk = false;
                    //PathInfo.nextVertexImagePath = '';
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => const ListRoomsScreen()));}),
          ]
        ),
      )
    );
  }
}

void _setPoints(AreaScreen widget, BuildContext context, Function func){
  for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
    widget.points.add(getVertexAsButtonOn2DMapForUser(UserInfo.area.vertexes![i], context, func));
  }
}

void _setPointsOfPath(AreaScreen widget, BuildContext context, Function func){
  for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
    for(int j = 0; j < PathInfo.listVertexes!.length; ++j){
      if(UserInfo.area.vertexes![i].uid == PathInfo.listVertexes![j].uid){
        widget.points.add(getVertexAsButtonOn2DMapForUserWithPath(UserInfo.area.vertexes![i], context, func));
        break;
      }
    }
  }
}
