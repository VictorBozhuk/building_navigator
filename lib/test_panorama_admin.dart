import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:lnu_navigator/test_panorama.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/path_model.dart';

class TestAdminParoramaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AdminParoramaScreenState();
}


class AdminParoramaScreenState extends State<TestAdminParoramaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
        onTap: (longitude, latitude, tilt) {
          AdminInfo.x = longitude;
          AdminInfo.y = latitude;
          setState(() {
          });
        },
        onViewChanged: ( longitude,  latitude,  tilt) {
          globalDirection = longitude;
          globalLatitude = latitude;
          globalTilt = tilt;
          print(longitude);
        },
        sensitivity: 2,
        child: Image.asset('assets/dormitory_3/7/704-706.jpg')

      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  TestPanoramaScreen()));
        },
      ),
    );
  }
}
