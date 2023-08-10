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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Image.asset(
              'assets/titleLogo.png',
              width: 60,
              height: 60,
            ),
          ),
          backgroundColor: Color(0xffFFFFFF),
          toolbarHeight: 50,
        ),
        body: Center(child:
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text('촬영 예시',style: TextStyle(
              fontSize: 30,
            ),
            ),
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
          shape: CircularNotchedRectangle(), // 테두리 없음
          elevation: 0, // 그림자 없음

          child: Container(
            color: Color(0xFFF3F3F3),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8, 20, 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffE0E5F5),
                  borderRadius: BorderRadius.circular(20.0), // 테두리를 둥글게 만듦
                ),

                // color: Color(0xff1E1651),

                child: SizedBox(
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/d');
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
