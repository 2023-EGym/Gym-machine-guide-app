import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(ChestpressPage());
}

class ChestpressPage extends StatelessWidget {
  const ChestpressPage({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      home: Scaffold(
        body:
        Column(
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.redAccent,
                    ),
                    Container(
                      color: Colors.blueAccent,
                    ),
                    Container(
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
