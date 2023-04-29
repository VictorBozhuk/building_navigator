import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/indicators/indicator.dart';
import 'package:lnu_navigator/screens/widgets/transformation/matrix_gesture_detector.dart';
import '../models/area_model.dart';
import '../models/path_model.dart';
import '../models/picture_size_model.dart';
import '../models/user_info.dart';
import '../navigation/navi.dart';
import '../styles/appTheme.dart';
import 'actions/actions.dart';
import 'rooms_list_screen.dart';

class AreaScreen extends StatefulWidget {
  late Area area;
  AreaScreen({super.key, required this.area});

  @override
  State<StatefulWidget> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  bool isExpanderBuilded = false;
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _calculateDimension());
    //SchedulerBinding.instance.addPostFrameCallback((_) async => await _calculateDimension());
    //WidgetsBinding.instance.endOfFrame.then((_) async {
    //  setState(() { });
    //});
    super.initState();
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
                Navi.pushThenAction(context, const RoomsListRoute(), action: () => setState(() {}));
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
                          key: expanderKey,
                          child: FutureBuilder<bool>(
                            future: setScreenData(),
                            builder: (_, AsyncSnapshot<bool> snapshot) {
                              if (snapshot.hasData) {
                                return GestureDetector(onTapUp: (TapUpDetails details) { },
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
                                );
                              } else {
                                return const Indicator();
                              }
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
    );
  }

  Future<bool> setScreenData() async {
    if(isExpanderBuilded == true){
      await _calculateDimension();
    }
    isExpanderBuilded = true;
    return true;
  }

  Future _calculateDimension() async {
    if(isExpanderBuilded == false){
      isExpanderBuilded = true;
    }
    var pictureSize = await getPictureSizes(expanderKey, UserInfo.area.imagePath);
    if(PathInfo.isReadyToGo){
      _setWidgetsOfPath(context, setStateAnalog, pictureSize);
    }else {
      _setWidgets(context, setStateAnalog, pictureSize);
    }
  }

  void _setWidgets(BuildContext context, Function func, PictureSize pictureSize) {
    _setMap();
    _setPoints(context, func, pictureSize);
  }

  void _setWidgetsOfPath(BuildContext context, Function func, PictureSize pictureSize){
    _setMap();
    _setPointsOfPath(context, func, pictureSize);
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(UserInfo.area.imagePath),
    ));
  }

  void _setPoints(BuildContext context, Function func, PictureSize pictureSize){
    for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
      if(UserInfo.area.title == "1 floor"){
        points.add(getVertexAsButtonOn2DMapForUser(UserInfo.area.vertexes![i], context, func, pictureSize, radius: UserInfo.area.vertexRadius));
      }else{
        points.add(getVertexAsButtonOn2DMapForUser(UserInfo.area.vertexes![i], context, func, pictureSize));
      }
    }
  }

  void _setPointsOfPath(BuildContext context, Function func, PictureSize pictureSize){
    for(int i = 0; i < UserInfo.area.vertexes!.length; ++i){
      for(int j = 0; j < PathInfo.listVertexes!.length; ++j){
        if(UserInfo.area.vertexes![i].id == PathInfo.listVertexes![j].id){
          if(UserInfo.area.title == "1 floor"){
            points.add(getVertexAsButtonOn2DMapForUserWithPath(UserInfo.area.vertexes![i], context, func, pictureSize, radius: UserInfo.area.vertexRadius));
          } else{
            points.add(getVertexAsButtonOn2DMapForUserWithPath(UserInfo.area.vertexes![i], context, func, pictureSize));
          }
          break;
        }
      }
    }
  }
}


