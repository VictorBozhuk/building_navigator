import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/room_model.dart';
import '../../styles/text_styles/text_styles.dart';
import '../actions/actions.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import '../widgets/text_inputs/main_text_input.dart';
import 'list_rooms_admin_screen.dart';

class PanoramaRoomAdminScreen extends StatefulWidget{
  final String panoramaImagePath;
  final Room room;
  final bool isCreate;
  const PanoramaRoomAdminScreen({Key? key,
    required this.panoramaImagePath,
    required this.room,
    required this.isCreate,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaRoomAdminScreenState();
}

class _PanoramaRoomAdminScreenState extends State<PanoramaRoomAdminScreen> {
  late List<Hotspot> hotspots = [];
  late TextEditingController txtTitle;

  _changeTitle(String text){
      widget.room.title = text;
  }
  void setStateAnalog(){
    setState(() {
      hotspots = [getHotspot(widget.room)];
    });
  }
  @override
  Widget build(BuildContext context) {
    txtTitle = TextEditingController(text: widget.room.title);
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
              MainTextInput(
                inputController: txtTitle,
                hint: "Title",
                label: AdminInfo.room.title,
                onChanged: _changeTitle,
              ),
              Row(children: [
                  Text("FontSize: ${widget.room.fontSize.toInt().toString()}",
                    style: const TextStyle(color: Colors.red, fontSize: 22),),
                  PositionChangerButton(title: "-", onPressed: () {
                      widget.room.fontSize -= 1;
                      setStateAnalog();
                    },
                  ),
                  PositionChangerButton(title: "+", onPressed: () {
                      widget.room.fontSize += 1;
                      setStateAnalog();
                    },
                  ),
                MainComponentButton(title: 'Apply',
                  onPressed: () { setStateAnalog(); },)
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
            if (widget.isCreate == true) {
              AdminInfo.selectedVertex!.rooms ??= [];
              AdminInfo.selectedVertex!.rooms?.add(AdminInfo.room);
            }
            else {
              var room = AdminInfo.selectedVertex!.rooms!.firstWhere((x) =>
              x.uid == AdminInfo.room.uid);
              room.title = AdminInfo.room.title;
              room.titleX = AdminInfo.room.titleX;
              room.titleY = AdminInfo.room.titleY;
              room.direction = AdminInfo.room.direction;
            }
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
            const ListRoomsAdminScreen()));
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