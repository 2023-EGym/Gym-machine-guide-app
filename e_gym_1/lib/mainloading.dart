import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
void main() {
  runApp(MainLoadingPage());
}

class MainLoadingPage extends StatefulWidget {
  const MainLoadingPage({super.key});

  @override
  State<MainLoadingPage> createState() => _MainLoadingPageState();
}

class _MainLoadingPageState extends State<MainLoadingPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushNamed(context, '/b');
    });
  }
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(children: [
            SizedBox(height: 100,),
            Image(
                    image: AssetImage('assets/logo.png'),
                    width: 200, // 이미지의 너비 설정

                    ),
                              SizedBox(height: 250,),

            Text('간편하게 카메라 하나로',style : TextStyle(fontSize: 18)),
              Text('운동의 모든 정보를 알 수 있어요',style : TextStyle(fontSize: 18)),
                              SizedBox(height: 70,),


            Text('E-GYM', style : TextStyle(fontSize: 40)),





          ]),

            ),
      ),
    );
  }
}

