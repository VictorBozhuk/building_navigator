import 'package:flutter/material.dart';
import '../loader/building_loader.dart';
import '../navigation/navi.dart';
import '../services/locator.dart';
import '../styles/text_styles/text_styles.dart';
import 'areas_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //
      //await BuildingLoader().addBuildings();
      //await deleteAllBuildings();
      //
      Navi.pushReplacement(context, const AreasListScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/lnu_logo_n.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(padding: EdgeInsets.only(top: 150)),
            Image(
              height: 100,
              color: Colors.white,
              image: AssetImage("assets/lnu_l.png"),
              fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("Welcome to", style: textStyleOnSplashScreen),
            Text('LNU Navigator', style: textStyleOnSplashScreen),
          ],
        ),
      ),
    );
  }

  //Future<void> deleteAllBuildings() async {
  //  var buildings = await getIt<BuildingService>().getAll();
  //  for(var b in buildings){
  //    await getIt<BuildingService>().delete(b);
  //  }
  //}
}
