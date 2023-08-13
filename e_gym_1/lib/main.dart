import 'package:e_gym_1/chestinfo.dart';
import 'package:e_gym_1/crunch.dart';
import 'package:e_gym_1/hipabduction.dart';
import 'package:e_gym_1/inclinebench.dart';
import 'package:e_gym_1/latpulldown.dart';
import 'package:e_gym_1/legpress.dart';
import 'package:e_gym_1/peckdeckfly.dart';
import 'package:e_gym_1/seatedrow.dart';
import 'package:flutter/material.dart';
import 'package:e_gym_1/mainloading.dart';
import 'package:e_gym_1/start.dart';
import 'package:e_gym_1/example.dart';
import 'package:e_gym_1/pic.dart';
import 'package:e_gym_1/loading.dart';
import 'package:e_gym_1/fail.dart';
import 'package:flutter/services.dart';
// void main() => runApp(MainApp());
void main()  async{

  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
                          debugShowCheckedModeBanner: false,

      initialRoute: '/crunch',
      routes: {
        '/a' : (context) => MainLoadingPage(),
        '/b' : (context) => StartPage(),
        '/c' : (context) => ExamplePage(),
        '/d' : (context) => PicPage(),
        '/f' : (context) => LoadingPage(),
        // 운동
        '/chest' : (context) => ChestInfoPage(),
        '/crunch' : (context) => Crunch(),
        '/hip' : (context) => HipabductionPage(),
        '/incline' : (context) => InclineBench(),
        '/latpull' : (context) => LatpulldownPage(),
        '/legpress' : (context) => LegpressPage(),
        '/peckdeck' : (context) => PeckDeckFly(),
        '/seated' : (context) => SeatedRow(),


        '/g' : (context) => FailPage(),
      },
    );
  }
}
