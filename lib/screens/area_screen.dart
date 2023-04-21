import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/building/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/transformation/matrix_gesture_detector.dart';
import '../models/path_model.dart';
import '../models/picture_size_model.dart';
import '../models/user_info.dart';
import '../styles/appTheme.dart';
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

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(UserInfo.area.title, context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          PathInfo.isWalk = false;
          //PathInfo.nextVertexImagePath = '';
          Navigator.push(
              context,
              MaterialPageRoute(builder:
                  (context) => const ListRoomsScreen()));
        },
        label: const Text('Search'),
        icon: Icon(Icons.search),
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
      ),
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
          ],
        ),
      )
    );
  }

  Future _calculateDimension() async {
    var pictureSize = await getPictureSizes(widget.expanderKey, UserInfo.area.imagePath);
    if(PathInfo.isReadyToGo){
      _setWidgetsOfPath(widget, context, setStateAnalog, pictureSize);
    }else {
      _setWidgets(widget, context, setStateAnalog, pictureSize);
    }
    setState(() { });
  }


  void _setWidgets(AreaScreen widget, BuildContext context, Function func, PictureSize pictureSize) {
    _setMap(widget);
    _setPoints(widget, context, func, pictureSize);
  }

  void _setWidgetsOfPath(AreaScreen widget, BuildContext context, Function func, PictureSize pictureSize){
    _setMap(widget);
    _setPointsOfPath(widget, context, func, pictureSize);
  }

  void _setMap(AreaScreen widget){
    widget.points.add(Container(
      child: getAreaImage(UserInfo.area.imagePath),
    ));
  }

  void _setPoints(AreaScreen widget, BuildContext context, Function func, PictureSize pictureSize){
    for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
      widget.points.add(getVertexAsButtonOn2DMapForUser(UserInfo.area.vertexes![i], context, func, pictureSize));
    }
  }

  void _setPointsOfPath(AreaScreen widget, BuildContext context, Function func, PictureSize pictureSize){
    for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
      for(int j = 0; j < PathInfo.listVertexes!.length; ++j){
        if(UserInfo.area.vertexes![i].uid == PathInfo.listVertexes![j].uid){
          widget.points.add(getVertexAsButtonOn2DMapForUserWithPath(UserInfo.area.vertexes![i], context, func, pictureSize));
          break;
        }
      }
    }
  }
}


