import 'package:building_navigator/loader/dormitory_3/rooms_dormitory_3.dart';
import 'package:building_navigator/loader/dormitory_3/vertexes_path_dormitory_3.dart';
import 'package:panorama/panorama.dart';
import 'package:flutter/material.dart';

import '../hotspots/hotspots.dart';



List<Hotspot> getHotspotsDormitory3(BuildContext context, String vertex, String nextVertexImagePath){
  switch(vertex) {
    case p704_706:
      return getHotspots704_706(context, nextVertexImagePath);
    case p707:
      return getHotspots707(context, nextVertexImagePath);
    case p701_707:
      return getHotspots701_707(context, nextVertexImagePath);
    case p701_703:
      return getHotspots701_703(context, nextVertexImagePath);
    case p701A:
      return getHotspots701A(context, nextVertexImagePath);
    case p714A:
      return getHotspots714A(context, nextVertexImagePath);
    case p714:
      return getHotspots714(context, nextVertexImagePath);
    case p711_713:
      return getHotspots711_713(context, nextVertexImagePath);
    case p708_710:
      return getHotspots708_710(context, nextVertexImagePath);
    case p701_707b:
      return getHotspots701_707b(context, nextVertexImagePath);
    default:
      return [];
  }
}

List<Hotspot> getHotspots704_706(BuildContext context, String nextVertexImagePath){
  Hotspot room706 = getHotspotTitleRoom(r706, 60, 10);
  Hotspot room705 = getHotspotTitleRoom(r705, -3, 10);
  Hotspot room704 = getHotspotTitleRoom(r704, -40, 10);

  Hotspot balcony = getHotspotOpenDoor(-100, 0, 0, 100, context, p701_707b, nextVertexImagePath);
  Hotspot to707 = getHotspotPoint(115, -13, 0, 100, context, p707, nextVertexImagePath);

  var hotspots = [room706, room705, room704];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p707){
      hotspots.addAll([to707]);
    }else if(nextVertexImagePath == p701_707b){
      hotspots.addAll([balcony]);
    }
  } else{
    hotspots.addAll([to707, balcony]);
  }

  return hotspots;
}

List<Hotspot> getHotspots707(BuildContext context, String nextVertexImagePath){
  Hotspot room707 = getHotspotTitleRoom(r707, -3, 20);
  Hotspot to701_707 = getHotspotPoint(120, -15, 0, 140, context, p701_707, nextVertexImagePath);
  Hotspot to704_706 = getHotspotPoint(-105, 0, 0, 100, context, p704_706, nextVertexImagePath);

  var hotspots = [room707];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p701_707){
      hotspots.addAll([to701_707]);
    }else if(nextVertexImagePath == p704_706){
      hotspots.addAll([to704_706]);
    }
  }else{
    hotspots.addAll([to704_706, to701_707]);
  }


  return hotspots;
}

List<Hotspot> getHotspots701_707(BuildContext context, String nextVertexImagePath) {
  Hotspot to701A = getHotspotPoint(105, -10, 0, 150, context, p701A, nextVertexImagePath);
  Hotspot to701_703 = getHotspotPoint(267, -5, 0, 100, context, p701_703, nextVertexImagePath);
  Hotspot to707 = getHotspotPoint(337, -16, 0, 130, context, p707, nextVertexImagePath);

  List<Hotspot> hotspots = [];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p701A){
      hotspots.addAll([to701A]);
    }else if(nextVertexImagePath == p701_703){
      hotspots.addAll([to701_703]);
    }else if(nextVertexImagePath == p707){
      hotspots.addAll([to707]);
    }
  }else{
    hotspots.addAll([to707, to701_703, to701A]);
  }

  return hotspots;
}

List<Hotspot> getHotspots701_703(BuildContext context, String nextVertexImagePath){
  Hotspot room701 = getHotspotTitleRoom(r701, -35, 10);
  Hotspot room702 = getHotspotTitleRoom(r702, 20, 10);
  Hotspot room703 = getHotspotTitleRoom(r703, 52, 10);

  Hotspot balcony = getHotspotOpenDoor(105, 0, 0, 100, context, p701_707b, nextVertexImagePath);
  Hotspot to701_707 = getHotspotPoint(-95, -10, 0, 100, context, p701_707, nextVertexImagePath);

  var hotspots = [room701, room702, room703];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p701_707){
      hotspots.addAll([to701_707]);
    }else if(nextVertexImagePath == p701_707b){
      hotspots.addAll([balcony]);
    }
  } else{
    hotspots.addAll([balcony, to701_707]);
  }

  return hotspots;
}

List<Hotspot> getHotspots701_707b(BuildContext context, String nextVertexImagePath){
  Hotspot to704_706 = getHotspotOpenDoor(155, 10, 0, 140, context, p704_706, nextVertexImagePath);
  Hotspot to701_703 = getHotspotOpenDoor(-115, 10, 0, 140, context, p701_703, nextVertexImagePath);

  List<Hotspot> hotspots = [];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p701_703){
      hotspots.addAll([to701_703]);
    }else if(nextVertexImagePath == p704_706){
      hotspots.addAll([to704_706]);
    }
  } else{
    hotspots.addAll([to704_706, to701_703]);
  }

  return hotspots;
}

List<Hotspot> getHotspots701A(BuildContext context, String nextVertexImagePath){
  Hotspot room701A = getHotspotTitleRoom(r701A, 180, 20);
  Hotspot to714A = getHotspotPoint(92, -10, 0, 100, context, p714A, nextVertexImagePath);
  Hotspot to701_707 = getHotspotPoint(-86, -10, 0, 100, context, p701_707, nextVertexImagePath);

  var hotspots = [room701A];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p714A){
      hotspots.addAll([to714A]);
    }else if(nextVertexImagePath == p701_707){
      hotspots.addAll([to701_707]);
    }
  }else{
    hotspots.addAll([to714A, to701_707]);
  }

  return hotspots;
}

List<Hotspot> getHotspots714A(BuildContext context, String nextVertexImagePath){
  Hotspot room714A = getHotspotTitleRoom(r714A, 8, 15);
  Hotspot to714 = getHotspotPoint(163, -18, 0, 130, context, p714, nextVertexImagePath);
  Hotspot to708_710 = getHotspotPoint(85, -8, 0, 100, context, p708_710, nextVertexImagePath);
  Hotspot to701A = getHotspotPoint(-80, -13, 0, 100, context, p701A, nextVertexImagePath);

  var hotspots = [room714A];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p714){
      hotspots.addAll([to714]);
    }else if(nextVertexImagePath == p708_710){
      hotspots.addAll([to708_710]);
    }else if(nextVertexImagePath == p701A){
      hotspots.addAll([to701A]);
    }
  }else{
    hotspots.addAll([to714, to708_710, to701A]);
  }

  return hotspots;
}

List<Hotspot> getHotspots708_710(BuildContext context, String nextVertexImagePath){
  Hotspot room708 = getHotspotTitleRoom(r708, -45, 10);
  Hotspot room709 = getHotspotTitleRoom(r709, 15, 10);
  Hotspot room710 = getHotspotTitleRoom(r710, 60, 10);

  Hotspot to714A = getHotspotPoint(-103, -10, 0, 100, context, p714A, nextVertexImagePath);

  var hotspots = [room708, room709, room710];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p714A){
      hotspots.addAll([to714A]);
    }
  } else{
    hotspots.addAll([to714A]);
  }

  return hotspots;
}

List<Hotspot> getHotspots714(BuildContext context, String nextVertexImagePath){
  Hotspot room714 = getHotspotTitleRoom(r714, 5, 5);
  Hotspot to714A = getHotspotPoint(123, -20, 0, 120, context, p714A, nextVertexImagePath);
  Hotspot to711_713 = getHotspotPoint(253, -10, 0, 100, context, p711_713, nextVertexImagePath);

  var hotspots = [room714];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p714A){
      hotspots.addAll([to714A]);
    }else if(nextVertexImagePath == p711_713){
      hotspots.addAll([to711_713]);
    }
  }else{
    hotspots.addAll([to714A, to711_713]);
  }

  return hotspots;
}

List<Hotspot> getHotspots711_713(BuildContext context, String nextVertexImagePath){
  Hotspot room711 = getHotspotTitleRoom(r711, 60, 10);
  Hotspot room712 = getHotspotTitleRoom(r712, -3, 10);
  Hotspot room713 = getHotspotTitleRoom(r713, -40, 10);

  Hotspot to714 = getHotspotPoint(120, -17, 0, 100, context, p714, nextVertexImagePath);

  var hotspots = [room711, room712, room713];
  if(nextVertexImagePath.isEmpty == false)
  {
    if(nextVertexImagePath == p714){
      hotspots.addAll([to714]);
    }
  } else{
    hotspots.addAll([to714]);
  }

  return hotspots;
}
