import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import '../../models/room_model.dart';
import '../../models/vertex_model.dart';
import '../../navigation/navi.dart';
import '../../providers/vertexes_provider.dart';
import '../../styles/text_styles/text_styles.dart';
import '../actions/actions.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/circle_button.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/paddings/main_padding.dart';
import '../widgets/text_inputs/add_text_input.dart';

class PanoramaRoomAdminScreen extends StatefulWidget{
  late Vertex vertex;
  final Room room;
  PanoramaRoomAdminScreen({Key? key,
    required this.vertex,
    required this.room,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaRoomAdminScreenState();
}

class _PanoramaRoomAdminScreenState extends State<PanoramaRoomAdminScreen> {
  late VertexesProvider vertexProvider;
  late List<Hotspot> hotspots = [];
  late TextEditingController txtTitle = TextEditingController();
  bool isColorPanelVisible = false;

  void setStateAnalog(){
    hotspots = [getHotspot()];
    setState(() { });
  }

  void changeColor(Color color) {
    widget.room.color = color;
    setState(() => {});
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
    vertexProvider = Provider.of<VertexesProvider>(context, listen: false);
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
            child: Image.network(widget.vertex.panoramaImagePath!),
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
                ],),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainPadding(
                child: ElevatedButton.icon(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
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
            buildColorPicker(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          if(widget.vertex.rooms.any((r) => r.id == widget.room.id) == false){
            widget.vertex.rooms.add(widget.room);
          }
          await vertexProvider.addOrUpdate(widget.vertex, vertexProvider.area);
          Navi.pop(context);
          //Navi.popAndPushReplacement(context, const RoomsListAdminRoute());
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Widget buildColorPicker(){
    return SizedBox.expand(child:
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
      ),
    );
  }

  Hotspot getHotspot()
  {
    return Hotspot(
      width: widget.room.titleBoxWidth,
      height: widget.room.titleBoxHeight,
      longitude: widget.room.titleX,
      latitude: widget.room.titleY,
      orgin: Offset.fromDirection(0),
      widget: Container(
        decoration: BoxDecoration(
            border: Border.all(color: widget.room.color)
        ),

        child: Text(widget.room.title,
            textAlign: TextAlign.center,
            style: textStyleRoomTitleOnPanorama(widget.room)),
      ),
    );
  }
}

