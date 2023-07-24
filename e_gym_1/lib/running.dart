import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';
void main() {
  runApp(RunningPage());
}

class RunningPage extends StatelessWidget {
  const RunningPage  ({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Center(

          child: Column(
            children: [
              SizedBox(height: 100,),
              Image(image: AssetImage('assets/running.png'

              ),
              width: 400,),
              SizedBox(height: 50,),

              Text("러닝머신",style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),),
                              SizedBox(height: 40,),

              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _launchURL,
                  child: Text('사용법 영상 보기 !'),
                  style: ElevatedButton.styleFrom(


                    primary: Color(0xff1E1651),
                    textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20)
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color(0xff1E1651),
            child: SizedBox(
              height: 80.0,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/d');
                  },
                  child: Text("다시촬영하기",
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


_launchURL() async {
  const url = 'https://www.youtube.com/watch?v=lQX9SciOvBY';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}