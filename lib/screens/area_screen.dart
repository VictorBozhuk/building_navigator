import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/indicators/indicator.dart';
import 'package:lnu_navigator/screens/widgets/transformation/matrix_gesture_detector.dart';
import 'package:lnu_navigator/screens/widgets/transformation/transform_detector.dart';
import 'package:provider/provider.dart';
import '../models/area_model.dart';
import '../models/path_model.dart';
import '../models/picture_size_model.dart';
import '../models/user_info.dart';
import '../navigation/navi.dart';
import '../providers/vertexes_provider.dart';
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
  late VertexesProvider vertexProvider;
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
    vertexProvider = Provider.of<VertexesProvider>(context);
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: getAppBar(widget.area.title, context),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navi.pushThenAction(context, const RoomsListRoute(), action: () => setState(() {}));
              },
              label: const Text('Search'),
              icon: const Icon(Icons.search),
              backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
            ),
            body: Column(children: [
              Expanded(key: expanderKey, child: TransformDetector(notifier,
                onTap: onAreaTap,
                child: Stack(children: points,),
              ),)
            ],)
    );
  }

  Future<void> onAreaTap(TapUpDetails details) => Future.delayed(Duration.zero);

  Future _calculateDimension() async {
    var pictureSize = await getPictureSizes(expanderKey, widget.area.imagePath);
    if(PathInfo.isReadyToGo){
      _setWidgetsOfPath(context, _calculateDimension, pictureSize);
    }else {
      _setWidgets(context, _calculateDimension, pictureSize);
    }
    setState(() { });
  }

  void _setWidgets(BuildContext context, Future Function() func, PictureSize pictureSize) {
    _setMap();
    _setPoints(context, func, pictureSize);
  }

  void _setWidgetsOfPath(BuildContext context, Future Function() func, PictureSize pictureSize){
    _setMap();
    _setPointsOfPath(context, func, pictureSize);
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(widget.area.imagePath),
    ));
  }

  void _setPoints(BuildContext context, Future Function() func, PictureSize pictureSize){
    for(int i = 0; i < widget.area.vertexes.length; ++i){
      points.add(getVertexAsButtonOn2DMapForUser(
          vertex: widget.area.vertexes[i],
          context: context,
          func: func,
          pictureSize: pictureSize,
          vertexProvider: vertexProvider,
          radius: widget.area.vertexRadius));
    }
  }

  void _setPointsOfPath(BuildContext context, Future Function() func, PictureSize pictureSize){
    for(int i = 0; i < widget.area.vertexes.length; ++i){
      for(int j = 0; j < PathInfo.listVertexes!.length; ++j){
        if(UserInfo.area.vertexes[i].id == PathInfo.listVertexes![j].id){
          points.add(getVertexAsButtonOn2DMapForUser(
              vertex: widget.area.vertexes[i],
              context: context,
              func: func,
              pictureSize: pictureSize,
              vertexProvider: vertexProvider,
              radius: widget.area.vertexRadius));
          break;
        }
      }
    }
  }
}


