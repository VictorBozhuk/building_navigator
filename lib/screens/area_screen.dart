import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/figures/circle.dart';
import 'package:lnu_navigator/screens/widgets/indicators/indicator.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:lnu_navigator/screens/widgets/transformation/matrix_gesture_detector.dart';
import 'package:lnu_navigator/screens/widgets/transformation/transform_detector.dart';
import 'package:provider/provider.dart';
import '../models/area_model.dart';
import '../models/picture_size_model.dart';
import '../models/user_info.dart';
import '../navigation/navi.dart';
import '../providers/areas_provider.dart';
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
  late AreasProvider areaProvider;
  late List<Widget> points = [];
  final GlobalKey expanderKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _calculateDimension());
    super.initState();
  }

  void setStateAnalog(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    vertexProvider = Provider.of<VertexesProvider>(context);
    areaProvider = Provider.of<AreasProvider>(context);
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(widget.area.title, context),
      floatingActionButton: getFloatingActionButton(),
      body: Column(children: [
        Expanded(key: expanderKey, child:
          TransformDetector(notifier,
            onTap: (TapUpDetails details) => Future.delayed(Duration.zero),
            child: Stack(children: points,),
          ),)
      ],)
    );
  }

  Widget getFloatingActionButton(){
    return FloatingActionButton.extended(
      onPressed: () async {
        if(areaProvider.isShowPath){
          areaProvider.isShowPath = false;
          await _calculateDimension();
        } else {
          //
          // Show message Select point
          //
          if(areaProvider.firstSelected != null){
            Navi.pushThenFutureAction(context, const RoomsListScreen(), action: _calculateDimension);
          }
        }
      },
      label: areaProvider.isShowPath ? const Text('Clear  ') : const Text('Search'),
      icon: areaProvider.isShowPath ? const Icon(Icons.clear) : const Icon(Icons.search),
      backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
    );
  }

  Future _calculateDimension() async {
    var pictureSize = await getPictureSizes(expanderKey, widget.area.imagePath);
    _setMap();
    if(areaProvider.isShowPath){
      _setPointsOfPath(context, _calculateDimension, pictureSize);
    } else {
      _setPoints(context, _calculateDimension, pictureSize);
    }
    setState(() { });
  }

  void _setMap(){
    points.add(Container(
      child: getAreaImage(widget.area.imagePath),
    ));
  }

  void _setPoints(BuildContext context, Future Function() func, PictureSize pictureSize){
    for(var v in widget.area.vertexes){
      points.add(getVertexAsButtonOn2DMapForUser(
          vertex: v,
          context: context,
          func: func,
          pictureSize: pictureSize,
          areaProvider: areaProvider,
          radius: widget.area.vertexRadius));
    }
  }

  void _setPointsOfPath(BuildContext context, Future Function() func, PictureSize pictureSize){
    for(var v in widget.area.vertexes){
      if(areaProvider.vertexesOfPath.any((vop) => vop.id == v.id) == true){
        points.add(getVertexAsButtonOn2DMapForUser(
            vertex: v,
            context: context,
            func: func,
            pictureSize: pictureSize,
            areaProvider: areaProvider,
            radius: widget.area.vertexRadius));
      }
    }
  }
}


