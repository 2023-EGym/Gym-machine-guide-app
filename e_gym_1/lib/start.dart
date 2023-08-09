import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(StartPage());
}



class StartPage extends StatelessWidget {
  // const StartP age({super.key});
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Image.asset(
              'assets/titleLogo.png',
              width: 60,
              height: 60,
            ),
          ),
          backgroundColor: Color(0xffFFFFFF),
          toolbarHeight: 50,
        ),
        backgroundColor: Color(0xffFFFFFF),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('배우고 싶은 기구 촬영',
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 300.0,
                height: 300.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/c');
                  },
                    child: Image.asset('assets/picbutton.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

