import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(SeatedRow());
}

class SeatedRow extends StatelessWidget {
  const SeatedRow({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기

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
          backgroundColor: Colors.white,
          toolbarHeight: 50,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(children: <Widget>[
                Container(
                  width: 350,
                  child: Image.asset('assets/machine_back.png',
                      fit: BoxFit.contain),
                ),
                Positioned(
                  top: 40,
                  left: 48,
                  child: Image(
                    image: AssetImage('assets/seatedrow.png'),
                    width: 250,
                  ),
                ),
              ]),
              Text(
                "시티드 로우 머신",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "이 기구가 맞나요 ?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xffE0E5F5),
                  borderRadius: BorderRadius.circular(15.0), // 테두리를 둥글게 만듦
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWebView(),
                        ),
                      );
                    },
                    child: Text(
                      '네, 사용법 영상 볼래요.',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xffF5E3E0),
                  borderRadius: BorderRadius.circular(15.0), // 테두리를 둥글게 만듦
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/d');
                    },
                    child: Text(
                      '재촬영할게요.',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  WebViewController? _webViewController;

  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://www.youtube.com/watch?v=78Vx_pnn_eM'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff583DCE), //색변경
        ),
        backgroundColor: Colors.white,
        title: Text('시티드 로우 머신'),
      ),
      body: WebViewWidget(controller: _webViewController!),
    );
  }
}
