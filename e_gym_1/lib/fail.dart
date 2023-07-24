import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
void main() {
  runApp(FailPage());
}

class FailPage extends StatelessWidget {
  const FailPage({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250.0,
              ),
              Text("인식이 제대로 되지 않았어요!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black
              ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("다시 시도해주세요."),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E1651),
                    minimumSize: Size(380, 50),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/d');
                  },
                  child: Text("네")),
            ],
          ),
        ),
      ),
    );
  }
}
