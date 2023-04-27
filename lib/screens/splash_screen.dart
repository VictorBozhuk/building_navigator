import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import '../navigation/navi.dart';
import '../services/database.dart';
import '../services/locator.dart';
import '../styles/text_styles/text_styles.dart';
import 'buildings_list_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () async {
      //
      //await deleteAllBuildings();
      //
      Navi.push(context, BuildingsListRoute());
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 100,
              width: 100,
              color: Colors.white,
              image: AssetImage("assets/NB.png"),
              fit: BoxFit.cover,
            ),
            Text("Welcome to", style: textStyleOnSplashScreen),
            Text('Building Navigator', style: textStyleOnSplashScreen),
          ],
        ),
      ),
    );
  }


  Future<void> deleteAllBuildings() async {
    var buildings = await getIt<DatabaseService>().getAll();
    for(var b in buildings){
      await getIt<DatabaseService>().delete(b);
    }
  }

}
