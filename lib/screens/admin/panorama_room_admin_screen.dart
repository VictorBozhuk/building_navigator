import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/room_model.dart';
import '../../styles/text_styles/text_styles.dart';
import '../actions/actions.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import 'add_room_screen.dart';

class PanoramaRoomAdminScreen extends StatefulWidget{
  final String panoramaImagePath;
  final Room room;
  final bool isCreate;
  final int index;
  const PanoramaRoomAdminScreen({Key? key,
    required this.panoramaImagePath,
    required this.room,
    required this.isCreate,
    required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaRoomAdminScreenState();
}

class _PanoramaRoomAdminScreenState extends State<PanoramaRoomAdminScreen> {
  late List<Hotspot> hotspots = [];

  void setStateAnalog(){
    setState(() {
      hotspots = [getHotspot(widget.room)];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.room.title),
      body: Stack(
        children: [
          Panorama(
            onTap: (longitude, latitude, tilt) {
              widget.room.titleX = roundDouble(longitude);
              widget.room.titleY = roundDouble(latitude);
              setStateAnalog();
            },
            onViewChanged: (longitude, latitude, tilt) {
              widget.room.direction = roundDouble(longitude);
            },
            sensitivity: 2,
            hotspots: hotspots,
            child: Image.network(widget.panoramaImagePath),
          ),
          Column(
            children: [
              const Text("FontSize", style: TextStyle(color: Colors.red, fontSize: 22),),
              Row(children: [
                  PositionChangerButton(title: "-", onPressed: () {
                      widget.room.fontSize -= 1;
                      setStateAnalog();
                    },
                  ),
                  Text(widget.room.fontSize.toInt().toString(),
                    style: const TextStyle(color: Colors.red, fontSize: 22),),
                  PositionChangerButton(title: "+", onPressed: () {
                      widget.room.fontSize += 1;
                      setStateAnalog();
                    },
                  ),
                ],
              ),
              Row(children: [
                Text("Box width: ${widget.room.titleBoxWidth.toInt()}",
                  style: const TextStyle(color: Colors.red, fontSize: 22),),
                PositionChangerButton(title: "-", onPressed: () {
                  widget.room.titleBoxWidth -= 10;
                  setStateAnalog();
                },
                ),
                PositionChangerButton(title: "+", onPressed: () {
                  widget.room.titleBoxWidth += 10;
                  setStateAnalog();
                },
                ),
              ],
              ),
              Row(children: [
                Text("Box height: ${widget.room.titleBoxHeight.toInt()}",
                  style: const TextStyle(color: Colors.red, fontSize: 22),),
                PositionChangerButton(title: "-", onPressed: () {
                  widget.room.titleBoxHeight -= 10;
                  setStateAnalog();
                },
                ),
                PositionChangerButton(title: "+", onPressed: () {
                  widget.room.titleBoxHeight += 10;
                  setStateAnalog();
                },
                ),
              ],
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  AddRoomScreen(isCreate: widget.isCreate)));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Hotspot getHotspot(Room room)
{
  return Hotspot(
    width: AdminInfo.room.titleBoxWidth,
    height: AdminInfo.room.titleBoxHeight,
    longitude: room.titleX,
    latitude: room.titleY,
    orgin: Offset.fromDirection(0),
    widget: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red)
      ),

      child: Text(AdminInfo.room.title,
          textAlign: TextAlign.center,
          style: textStyleRoomTitleOnPanorama(room.fontSize)),
    ),
  );
}