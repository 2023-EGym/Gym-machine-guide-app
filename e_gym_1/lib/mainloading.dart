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
        backgroundColor: Color(0xff583DCE),
        body: Center(
          child: Image.asset('assets/mainloadinglogo.png',
          width: 300,
          height: 300,
          ),
        ),
      ),
    );
  }
}

