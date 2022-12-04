import 'package:flutter/material.dart';
import '../Style/text_styles/splash_screen_text_styles.dart';
import 'list_buildings.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      //Navigator.push(context,MaterialPageRoute(builder: (context) => ListBuildingsAdminScreen()));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ListBuildingsPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
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
      ),
    );
  }
}