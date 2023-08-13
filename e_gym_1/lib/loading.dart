import 'package:flutter/material.dart';


void main() {
  runApp(LoadingPage());
}
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});


  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pushNamed(context, '/b'); //조건문 사용하여 fail~machine5 중 한 페이지로 연결시키기
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Loading..."),
      ),
    );
  }
}
