import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/room_model.dart';
import '../../styles/text_styles/text_styles.dart';
import '../actions/actions.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/circle_button.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/paddings/main_padding.dart';
import '../widgets/text_inputs/add_text_input.dart';
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
  late TextEditingController txtTitle = TextEditingController();
  bool isColorPanelVisible = false;

  void setStateAnalog(){
    setState(() {
      hotspots = [getHotspot(widget.room)];
    });
  }

  void changeColor(Color color) {
    setState(() => widget.room.color = color);
  }

  @override
  void initState() {
    txtTitle.text = widget.room.title;
    txtTitle.addListener(() {
      widget.room.title = txtTitle.text;
      setStateAnalog();
    });
    super.initState();
  }

  @override
  void dispose() {
    txtTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.room.title, context),
      body: Stack(
        children: [
          Panorama(
            onTap: (longitude, latitude, tilt) {
              widget.room.titleX = roundDouble(longitude) + (widget.room.titleBoxWidth / 15);
              widget.room.titleY = roundDouble(latitude) + (widget.room.titleBoxHeight / 15);
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
              AddInput(
                inputController: txtTitle,
                hint: "Title",
                onSuffixTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setStateAnalog();
                  },
              ),
              MainPadding(
                top: 0,
                bottom: 5,
                child: Row(children: [
                  Text("FontSize: ${widget.room.fontSize.toInt().toString()}",
                    style: const TextStyle(color: Colors.red, fontSize: 22),),
                  CircleButton(text: "-", onPressed: () {
                        widget.room.fontSize -= 1;
                        setStateAnalog();
                      },
                    ),
                  CircleButton(text: "+", onPressed: () {
                        widget.room.fontSize += 1;
                        setStateAnalog();
                      },
                    ),
                  ],
                ),
              ),
              MainPadding(
                top: 0,
                bottom: 5,
                child: Row(children: [
                  Text("Box width: ${widget.room.titleBoxWidth.toInt()}",
                    style: const TextStyle(color: Colors.red, fontSize: 22),),
                  CircleButton(text: "-", onPressed: () {
                    widget.room.titleBoxWidth -= 10;
                    setStateAnalog();
                  },
                  ),
                  CircleButton(text: "+", onPressed: () {
                    widget.room.titleBoxWidth += 10;
                    setStateAnalog();
                  },
                  ),
                ],
                ),
              ),
              MainPadding(
                top: 0,
                child: Row(children: [
                  Text("Box height: ${widget.room.titleBoxHeight.toInt()}",
                    style: const TextStyle(color: Colors.red, fontSize: 22),),
                  CircleButton(text: "-", onPressed: () {
                    widget.room.titleBoxHeight -= 10;
                    setStateAnalog();
                  },
                  ),
                  CircleButton(text: "+", onPressed: () {
                    widget.room.titleBoxHeight += 10;
                    setStateAnalog();
                  },
                  ),

                ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainPadding(
                child: ElevatedButton.icon(
                  onPressed: () {
                    isColorPanelVisible = !isColorPanelVisible;
                    setStateAnalog();
                  },
                  icon: Icon(
                    Icons.circle,
                    size: 24.0,
                    color: widget.room.color,
                  ),
                  label: const Text('Color'),
                ),
              ),
            ],
          ),
          if(isColorPanelVisible)
            SizedBox.expand(child:
                Container(
                  margin: const EdgeInsets.all(60),
                  padding: const EdgeInsets.all(10),
                  transformAlignment: Alignment.center,
                    constraints: const BoxConstraints(
                      minHeight: 300,
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),),
                  child: Column(children: [
                    ColorPicker(
                      pickerColor: widget.room.color,
                      onColorChanged: changeColor,),
                    MainComponentButton(title: 'Ok',
                      onPressed: () {
                        isColorPanelVisible = !isColorPanelVisible;
                        setStateAnalog();
                      },)
                  ])
              ),)
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
        child: const Icon(Icons.check),
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
          border: Border.all(color: room.color)
      ),

      child: Text(AdminInfo.room.title,
          textAlign: TextAlign.center,
          style: textStyleRoomTitleOnPanorama(room)),
    ),
  );
}