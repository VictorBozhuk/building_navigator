import 'package:building_navigator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'loader/loader.dart';
import 'models/path_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    PathInfo.building = buildings[0];

    return Scaffold(
      body: Splash()


/*
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListByuldingsPage())),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/startup_logo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[ Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Welcome',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 70,
                                fontWeight: FontWeight.w800)),

                      ],
                    )
                    ]),)
            ),
*/

    );
  }
}
