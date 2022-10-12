import 'package:flutter/material.dart';
import 'list_buildings.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    //FirebaseFirestore.instance.collection('buildings').add({'building': buildings[0]});

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListBuildingsPage()));
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
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 100,
                width: 100,
                color: Colors.white,
                image: AssetImage("assets/NB.png"),
                fit: BoxFit.cover,
              ),
              Text("Welcome to", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w800)),
              Text('Building Navigator', style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w800)),
            ],
          ),
        )
      ),
    );
  }
}