
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:lnu_navigator/screens/admin/add_building_screen.dart';
import 'package:lnu_navigator/screens/admin/add_vertex_screen.dart';
import 'package:lnu_navigator/screens/admin/area_admin_screen.dart';
import 'package:lnu_navigator/screens/admin/areas_list_admin_screen.dart';
import 'package:lnu_navigator/screens/admin/panorama_room_admin_screen.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import 'package:lnu_navigator/screens/admin/rooms_list_admin_screen.dart';
import 'package:lnu_navigator/screens/admin/select_vertex_screen.dart';
import 'package:lnu_navigator/screens/buildings_list_screen.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/select_rooms_screen.dart';

import '../screens/admin/add_area_screen.dart';
import '../screens/admin/buildings_list_admin_screen.dart';
import '../screens/area_screen.dart';
import '../screens/areas_list_screen.dart';
import '../screens/rooms_list_screen.dart';
import '../screens/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          page: SplashScreen
        ),
        AutoRoute(
          path: 'buildings_list',
          page: BuildingsListScreen
        ),
        AutoRoute(
            path: 'buildings_list/areas_list',
            page: AreasListScreen
        ),
        AutoRoute(
            path: 'buildings_list/areas_list/area',
            page: AreaScreen
        ),
        AutoRoute(
            path: 'buildings_list/areas_list/select_rooms',
            page: SelectRoomsScreen
        ),
        AutoRoute(
            path: 'buildings_list/areas_list/area/rooms_list',
            page: RoomsListScreen
        ),
        AutoRoute(
            path: 'buildings_list/areas_list/area/panorama',
            page: PanoramaScreen
        ),


        AutoRoute(
            path: 'buildings_list_admin',
            page: BuildingsListAdminScreen
        ),
          AutoRoute(
              path: 'buildings_list_admin/add_building',
              page: AddBuildingScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin',
              page: AreasListAdminScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/select_vertex',
              page: SelectVertexScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/add_area',
              page: AddAreaScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/area_admin',
              page: AreaAdminScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex',
              page: AddVertexScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin',
              page: RoomsListAdminScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/rooms_list_admin/panorama_room',
              page: PanoramaRoomAdminScreen
          ),
          AutoRoute(
              path: 'buildings_list_admin/add_building/areas_list_admin/area_admin/add_vertex/panorama_vertex',
              page: PanoramaVertexAdminScreen
          ),
      ]
    )
  ]
)
class $AppRouter{}