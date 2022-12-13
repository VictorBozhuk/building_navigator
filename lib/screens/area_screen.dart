import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';
import 'package:lnu_navigator/screens/widgets/matrix_gesture_detector.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import 'actions/actions.dart';
import 'list_rooms_screen.dart';

class AreaScreen extends StatefulWidget {
  AreaScreen({super.key});
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  @override
  State<StatefulWidget> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _calculateDimension());
  }

  void setStateAnalog(){
    setState(() {});
  }

  Future _calculateDimension() async {
    await outputPoints(widget.expanderKey, UserInfo.area.imagePath);
    if(PathInfo.isReadyToGo){
      _setWidgetsOfPath(widget, context, setStateAnalog);
    }else {
      _setWidgets(widget, context, setStateAnalog);
    }
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
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
              Expanded(
                key: widget.expanderKey,
                child: GestureDetector(onTapUp: (TapUpDetails details) { },
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
                            (context) => const ListRoomsScreen()));
                  },
              ),
          ],
        ),
      )
    );
  }
}

void _setWidgets(AreaScreen widget, BuildContext context, Function func){
  _setMap(widget);
  _setPoints(widget, context, func);
}

void _setWidgetsOfPath(AreaScreen widget, BuildContext context, Function func){
  _setMap(widget);
  _setPointsOfPath(widget, context, func);
}

void _setMap(AreaScreen widget){
  widget.points.add(Container(
    child: getAreaImage(UserInfo.area.imagePath),
  ));
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
