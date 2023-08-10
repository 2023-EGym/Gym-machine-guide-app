import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ExamplePage());
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
                    debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Center(child:
        Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text('촬영 예시',style: TextStyle(
              fontSize: 30
            ),),
            SizedBox(
              height: 50,
            ),
            Image(
                    image: AssetImage('assets/use_exam.png'),
                    width: 440, // 이미지의 너비 설정

                    ),

          ],
        ),),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color(0xff583DCE),
            child: SizedBox(
              height: 80.0,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/d');
                  },
                  child: Text("네 확인했어요!",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 25
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
