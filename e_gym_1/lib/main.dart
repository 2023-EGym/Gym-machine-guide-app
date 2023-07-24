import 'package:e_gym_1/chestinfo.dart';
import 'package:e_gym_1/hipabduction.dart';
import 'package:e_gym_1/latpulldown.dart';
import 'package:e_gym_1/legpress.dart';
import 'package:e_gym_1/running.dart';
import 'package:flutter/material.dart';

import 'package:e_gym_1/mainloading.dart';
import 'package:e_gym_1/start.dart';
import 'package:e_gym_1/example.dart';
import 'package:e_gym_1/pic.dart';
import 'package:e_gym_1/loading.dart';
import 'package:e_gym_1/fail.dart';
import 'package:flutter/services.dart';
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// ['chest_press_machine',
//  'hip_abduction_machine',
//  'lat_pulldown_machine',
//  'leg_press_machine',
//  'running_machine']

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
                          debugShowCheckedModeBanner: false,

      initialRoute: '/a',
      routes: {
        '/a' : (context) => MainLoadingPage(),
        '/b' : (context) => StartPage(),
        '/c' : (context) => ExamplePage(),
        '/d' : (context) => PicPage(),
        '/f' : (context) => LoadingPage(),
        '/chest' : (context) => ChestInfoPage(),
        '/hip' : (context) => HipabductionPage(),
        '/latpull' : (context) => LatpulldownPage(),
        '/legpress' : (context) => LegpressPage(),
        '/running' : (context) => RunningPage(),
        '/g' : (context) => FailPage(),
      },
    );
  }
}
