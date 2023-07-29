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
        body: Center(
          child: Column(children: [
            SizedBox(height: 100,),
            Image(
                    image: AssetImage('assets/logo.png'),
                    width: 200, // 이미지의 너비 설정
                    ),
                              SizedBox(height: 250,),
            Text('손쉽게 카메라로 ',style : TextStyle(fontSize: 18)),
              Text('모든 운동 기구를 마스터하다',style : TextStyle(fontSize: 18)),
                              SizedBox(height: 70,),
            Text('E-GYM', style : TextStyle(fontSize: 40)),

          ]),

            ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color(0xff1E1651),
            child: SizedBox(
              height: 80.0,
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/c');
                },
                child: Text("시작하기",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,

                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

