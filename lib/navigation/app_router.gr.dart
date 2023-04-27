// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i20;

import '../models/area_model.dart' as _i23;
import '../models/building_model.dart' as _i21;
import '../models/room_model.dart' as _i24;
import '../models/vertex_connection_model.dart' as _i25;
import '../models/vertex_model.dart' as _i22;
import '../screens/admin/add_area_screen.dart' as _i13;
import '../screens/admin/add_building_screen.dart' as _i10;
import '../screens/admin/add_vertex_screen.dart' as _i15;
import '../screens/admin/area_admin_screen.dart' as _i14;
import '../screens/admin/areas_list_admin_screen.dart' as _i11;
import '../screens/admin/buildings_list_admin_screen.dart' as _i9;
import '../screens/admin/panorama_room_admin_screen.dart' as _i17;
import '../screens/admin/panorama_vertex_admin_screen.dart' as _i18;
import '../screens/admin/rooms_list_admin_screen.dart' as _i16;
import '../screens/admin/select_vertex_screen.dart' as _i12;
import '../screens/area_screen.dart' as _i5;
import '../screens/areas_list_screen.dart' as _i4;
import '../screens/buildings_list_screen.dart' as _i3;
import '../screens/panorama_screen.dart' as _i8;
import '../screens/rooms_list_screen.dart' as _i7;
import '../screens/select_rooms_screen.dart' as _i6;
import '../screens/splash_screen.dart' as _i2;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    BuildingsListRoute.name: (routeData) {
      final args = routeData.argsAs<BuildingsListRouteArgs>(
          orElse: () => const BuildingsListRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.BuildingsListScreen(key: args.key),
      );
    },
    AreasListRoute.name: (routeData) {
      final args = routeData.argsAs<AreasListRouteArgs>(
          orElse: () => const AreasListRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AreasListScreen(key: args.key),
      );
    },
    AreaRoute.name: (routeData) {
      final args =
          routeData.argsAs<AreaRouteArgs>(orElse: () => const AreaRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.AreaScreen(key: args.key),
      );
    },
    SelectRoomsRoute.name: (routeData) {
      final args = routeData.argsAs<SelectRoomsRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SelectRoomsScreen(
          key: args.key,
          building: args.building,
        ),
      );
    },
    RoomsListRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RoomsListScreen(),
      );
    },
    PanoramaRoute.name: (routeData) {
      final args = routeData.argsAs<PanoramaRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.PanoramaScreen(
          key: args.key,
          currentVertex: args.currentVertex,
          nextVertex: args.nextVertex,
        ),
      );
    },
    BuildingsListAdminRoute.name: (routeData) {
      final args = routeData.argsAs<BuildingsListAdminRouteArgs>(
          orElse: () => const BuildingsListAdminRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.BuildingsListAdminScreen(key: args.key),
      );
    },
    AddBuildingRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddBuildingScreen(),
      );
    },
    AreasListAdminRoute.name: (routeData) {
      final args = routeData.argsAs<AreasListAdminRouteArgs>(
          orElse: () => const AreasListAdminRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AreasListAdminScreen(key: args.key),
      );
    },
    SelectVertexRoute.name: (routeData) {
      final args = routeData.argsAs<SelectVertexRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.SelectVertexScreen(
          key: args.key,
          area: args.area,
        ),
      );
    },
    AddAreaRoute.name: (routeData) {
      final args = routeData.argsAs<AddAreaRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.AddAreaScreen(
          key: args.key,
          isCreate: args.isCreate,
        ),
      );
    },
    AreaAdminRoute.name: (routeData) {
      final args = routeData.argsAs<AreaAdminRouteArgs>(
          orElse: () => const AreaAdminRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.AreaAdminScreen(key: args.key),
      );
    },
    AddVertexRoute.name: (routeData) {
      final args = routeData.argsAs<AddVertexRouteArgs>(
          orElse: () => const AddVertexRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.AddVertexScreen(key: args.key),
      );
    },
    RoomsListAdminRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.RoomsListAdminScreen(),
      );
    },
    PanoramaRoomAdminRoute.name: (routeData) {
      final args = routeData.argsAs<PanoramaRoomAdminRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.PanoramaRoomAdminScreen(
          key: args.key,
          panoramaImagePath: args.panoramaImagePath,
          room: args.room,
          isCreate: args.isCreate,
        ),
      );
    },
    PanoramaVertexAdminRoute.name: (routeData) {
      final args = routeData.argsAs<PanoramaVertexAdminRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.PanoramaVertexAdminScreen(
          key: args.key,
          panoramaImagePath: args.panoramaImagePath,
          connection: args.connection,
          isCreate: args.isCreate,
        ),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i19.RouteConfig(
              SplashRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              BuildingsListRoute.name,
              path: 'buildings_list',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AreasListRoute.name,
              path: 'buildings_list/areas_list',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AreaRoute.name,
              path: 'buildings_list/areas_list/area',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              SelectRoomsRoute.name,
              path: 'buildings_list/areas_list/select_rooms',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              RoomsListRoute.name,
              path: 'buildings_list/areas_list/area/rooms_list',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              PanoramaRoute.name,
              path: 'buildings_list/areas_list/area/panorama',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              BuildingsListAdminRoute.name,
              path: 'buildings_list_admin',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AddBuildingRoute.name,
              path: 'buildings_list_admin/add_building',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AreasListAdminRoute.name,
              path: 'buildings_list_admin/add_building/areas_list_admin',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              SelectVertexRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/select_vertex',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AddAreaRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/add_area',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AreaAdminRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/area_admin',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              AddVertexRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              RoomsListAdminRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              PanoramaRoomAdminRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin/panorama_room',
              parent: EmptyRouterRoute.name,
            ),
            _i19.RouteConfig(
              PanoramaVertexAdminRoute.name,
              path:
                  'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/panorama_vertex',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i19.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.BuildingsListScreen]
class BuildingsListRoute extends _i19.PageRouteInfo<BuildingsListRouteArgs> {
  BuildingsListRoute({_i20.Key? key})
      : super(
          BuildingsListRoute.name,
          path: 'buildings_list',
          args: BuildingsListRouteArgs(key: key),
        );

  static const String name = 'BuildingsListRoute';
}

class BuildingsListRouteArgs {
  const BuildingsListRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'BuildingsListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.AreasListScreen]
class AreasListRoute extends _i19.PageRouteInfo<AreasListRouteArgs> {
  AreasListRoute({_i20.Key? key})
      : super(
          AreasListRoute.name,
          path: 'buildings_list/areas_list',
          args: AreasListRouteArgs(key: key),
        );

  static const String name = 'AreasListRoute';
}

class AreasListRouteArgs {
  const AreasListRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'AreasListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AreaScreen]
class AreaRoute extends _i19.PageRouteInfo<AreaRouteArgs> {
  AreaRoute({_i20.Key? key})
      : super(
          AreaRoute.name,
          path: 'buildings_list/areas_list/area',
          args: AreaRouteArgs(key: key),
        );

  static const String name = 'AreaRoute';
}

class AreaRouteArgs {
  const AreaRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'AreaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SelectRoomsScreen]
class SelectRoomsRoute extends _i19.PageRouteInfo<SelectRoomsRouteArgs> {
  SelectRoomsRoute({
    _i20.Key? key,
    required _i21.Building building,
  }) : super(
          SelectRoomsRoute.name,
          path: 'buildings_list/areas_list/select_rooms',
          args: SelectRoomsRouteArgs(
            key: key,
            building: building,
          ),
        );

  static const String name = 'SelectRoomsRoute';
}

class SelectRoomsRouteArgs {
  const SelectRoomsRouteArgs({
    this.key,
    required this.building,
  });

  final _i20.Key? key;

  final _i21.Building building;

  @override
  String toString() {
    return 'SelectRoomsRouteArgs{key: $key, building: $building}';
  }
}

/// generated route for
/// [_i7.RoomsListScreen]
class RoomsListRoute extends _i19.PageRouteInfo<void> {
  const RoomsListRoute()
      : super(
          RoomsListRoute.name,
          path: 'buildings_list/areas_list/area/rooms_list',
        );

  static const String name = 'RoomsListRoute';
}

/// generated route for
/// [_i8.PanoramaScreen]
class PanoramaRoute extends _i19.PageRouteInfo<PanoramaRouteArgs> {
  PanoramaRoute({
    _i20.Key? key,
    required _i22.Vertex currentVertex,
    _i22.Vertex? nextVertex,
  }) : super(
          PanoramaRoute.name,
          path: 'buildings_list/areas_list/area/panorama',
          args: PanoramaRouteArgs(
            key: key,
            currentVertex: currentVertex,
            nextVertex: nextVertex,
          ),
        );

  static const String name = 'PanoramaRoute';
}

class PanoramaRouteArgs {
  const PanoramaRouteArgs({
    this.key,
    required this.currentVertex,
    this.nextVertex,
  });

  final _i20.Key? key;

  final _i22.Vertex currentVertex;

  final _i22.Vertex? nextVertex;

  @override
  String toString() {
    return 'PanoramaRouteArgs{key: $key, currentVertex: $currentVertex, nextVertex: $nextVertex}';
  }
}

/// generated route for
/// [_i9.BuildingsListAdminScreen]
class BuildingsListAdminRoute
    extends _i19.PageRouteInfo<BuildingsListAdminRouteArgs> {
  BuildingsListAdminRoute({_i20.Key? key})
      : super(
          BuildingsListAdminRoute.name,
          path: 'buildings_list_admin',
          args: BuildingsListAdminRouteArgs(key: key),
        );

  static const String name = 'BuildingsListAdminRoute';
}

class BuildingsListAdminRouteArgs {
  const BuildingsListAdminRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'BuildingsListAdminRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.AddBuildingScreen]
class AddBuildingRoute extends _i19.PageRouteInfo<void> {
  const AddBuildingRoute()
      : super(
          AddBuildingRoute.name,
          path: 'buildings_list_admin/add_building',
        );

  static const String name = 'AddBuildingRoute';
}

/// generated route for
/// [_i11.AreasListAdminScreen]
class AreasListAdminRoute extends _i19.PageRouteInfo<AreasListAdminRouteArgs> {
  AreasListAdminRoute({_i20.Key? key})
      : super(
          AreasListAdminRoute.name,
          path: 'buildings_list_admin/add_building/areas_list_admin',
          args: AreasListAdminRouteArgs(key: key),
        );

  static const String name = 'AreasListAdminRoute';
}

class AreasListAdminRouteArgs {
  const AreasListAdminRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'AreasListAdminRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SelectVertexScreen]
class SelectVertexRoute extends _i19.PageRouteInfo<SelectVertexRouteArgs> {
  SelectVertexRoute({
    _i20.Key? key,
    required _i23.Area area,
  }) : super(
          SelectVertexRoute.name,
          path:
              'buildings_list_admin/add_building/areas_list_admin/select_vertex',
          args: SelectVertexRouteArgs(
            key: key,
            area: area,
          ),
        );

  static const String name = 'SelectVertexRoute';
}

class SelectVertexRouteArgs {
  const SelectVertexRouteArgs({
    this.key,
    required this.area,
  });

  final _i20.Key? key;

  final _i23.Area area;

  @override
  String toString() {
    return 'SelectVertexRouteArgs{key: $key, area: $area}';
  }
}

/// generated route for
/// [_i13.AddAreaScreen]
class AddAreaRoute extends _i19.PageRouteInfo<AddAreaRouteArgs> {
  AddAreaRoute({
    _i20.Key? key,
    required bool isCreate,
  }) : super(
          AddAreaRoute.name,
          path: 'buildings_list_admin/add_building/areas_list_admin/add_area',
          args: AddAreaRouteArgs(
            key: key,
            isCreate: isCreate,
          ),
        );

  static const String name = 'AddAreaRoute';
}

class AddAreaRouteArgs {
  const AddAreaRouteArgs({
    this.key,
    required this.isCreate,
  });

  final _i20.Key? key;

  final bool isCreate;

  @override
  String toString() {
    return 'AddAreaRouteArgs{key: $key, isCreate: $isCreate}';
  }
}

/// generated route for
/// [_i14.AreaAdminScreen]
class AreaAdminRoute extends _i19.PageRouteInfo<AreaAdminRouteArgs> {
  AreaAdminRoute({_i20.Key? key})
      : super(
          AreaAdminRoute.name,
          path: 'buildings_list_admin/add_building/areas_list_admin/area_admin',
          args: AreaAdminRouteArgs(key: key),
        );

  static const String name = 'AreaAdminRoute';
}

class AreaAdminRouteArgs {
  const AreaAdminRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'AreaAdminRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.AddVertexScreen]
class AddVertexRoute extends _i19.PageRouteInfo<AddVertexRouteArgs> {
  AddVertexRoute({_i20.Key? key})
      : super(
          AddVertexRoute.name,
          path:
              'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex',
          args: AddVertexRouteArgs(key: key),
        );

  static const String name = 'AddVertexRoute';
}

class AddVertexRouteArgs {
  const AddVertexRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'AddVertexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.RoomsListAdminScreen]
class RoomsListAdminRoute extends _i19.PageRouteInfo<void> {
  const RoomsListAdminRoute()
      : super(
          RoomsListAdminRoute.name,
          path:
              'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin',
        );

  static const String name = 'RoomsListAdminRoute';
}

/// generated route for
/// [_i17.PanoramaRoomAdminScreen]
class PanoramaRoomAdminRoute
    extends _i19.PageRouteInfo<PanoramaRoomAdminRouteArgs> {
  PanoramaRoomAdminRoute({
    _i20.Key? key,
    required String panoramaImagePath,
    required _i24.Room room,
    required bool isCreate,
  }) : super(
          PanoramaRoomAdminRoute.name,
          path:
              'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin/panorama_room',
          args: PanoramaRoomAdminRouteArgs(
            key: key,
            panoramaImagePath: panoramaImagePath,
            room: room,
            isCreate: isCreate,
          ),
        );

  static const String name = 'PanoramaRoomAdminRoute';
}

class PanoramaRoomAdminRouteArgs {
  const PanoramaRoomAdminRouteArgs({
    this.key,
    required this.panoramaImagePath,
    required this.room,
    required this.isCreate,
  });

  final _i20.Key? key;

  final String panoramaImagePath;

  final _i24.Room room;

  final bool isCreate;

  @override
  String toString() {
    return 'PanoramaRoomAdminRouteArgs{key: $key, panoramaImagePath: $panoramaImagePath, room: $room, isCreate: $isCreate}';
  }
}

/// generated route for
/// [_i18.PanoramaVertexAdminScreen]
class PanoramaVertexAdminRoute
    extends _i19.PageRouteInfo<PanoramaVertexAdminRouteArgs> {
  PanoramaVertexAdminRoute({
    _i20.Key? key,
    required String panoramaImagePath,
    required _i25.VertexConnection connection,
    required bool isCreate,
  }) : super(
          PanoramaVertexAdminRoute.name,
          path:
              'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/panorama_vertex',
          args: PanoramaVertexAdminRouteArgs(
            key: key,
            panoramaImagePath: panoramaImagePath,
            connection: connection,
            isCreate: isCreate,
          ),
        );

  static const String name = 'PanoramaVertexAdminRoute';
}

class PanoramaVertexAdminRouteArgs {
  const PanoramaVertexAdminRouteArgs({
    this.key,
    required this.panoramaImagePath,
    required this.connection,
    required this.isCreate,
  });

  final _i20.Key? key;

  final String panoramaImagePath;

  final _i25.VertexConnection connection;

  final bool isCreate;

  @override
  String toString() {
    return 'PanoramaVertexAdminRouteArgs{key: $key, panoramaImagePath: $panoramaImagePath, connection: $connection, isCreate: $isCreate}';
  }
}