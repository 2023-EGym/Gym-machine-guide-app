import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

void main() {
  runApp(PicPage());
}

class PicPage extends StatefulWidget {
  const PicPage({super.key});

  @override
  State<PicPage> createState() => _PicPageState();
}

class _PicPageState extends State<PicPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? _image;
  int result_index = 0;

  List<List<List<List<double>>>> convertTo3DArray(img.Image image) {
    int width = image.width;
    int height = image.height;

    // Image를 저장할 3차원 배열 생성
    List<List<List<double>>> imageArray = List.generate(
      height,
      (_) => List.generate(
        width,
        (_) => List<double>.filled(3, 0), // RGB 픽셀을 위해 3개의 원소를 가지는 리스트 생성
      ),
    );

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        img.Pixel pixel = image.getPixel(x, y);

        // 픽셀 값을 0과 1 사이의 실수로 정규화하여 3차원 배열에 저장
        imageArray[y][x][0] = pixel.r / 255.0; // R 값
        imageArray[y][x][1] = pixel.g / 255.0; // G 값
        imageArray[y][x][2] = pixel.b / 255.0; // B 값
      }
    }

    List<List<List<List<double>>>> fourarray = [];
    fourarray.add(imageArray);

    return fourarray;
  }

  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      if (image != null) {
        _image = File(image!.path); // 가져온 이미지를 _image에 저장
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사진을 선택해주세요 !'),
          duration: Duration(seconds: 3),
        ));
      }
    });
  }

  modelrun() async {
    final interpreter =
        await Interpreter.fromAsset('assets/model/best_student_model_8.tflite');

    if (_image != null) {
      Uint8List imageBytes = File(_image!.path).readAsBytesSync();
      img.Image resizedImage = img.decodeImage(imageBytes)!;
      img.Image image_d = img.copyResize(resizedImage, width: 224, height: 224);
      List<List<List<List<double>>>> imageArray = convertTo3DArray(image_d);

      List<List<double>> output = [
        [0, 0, 0, 0, 0, 0, 0, 0]
      ];

      interpreter.run(imageArray, output);

      List<double> model_result = output[0];
      int maxIndex =
          model_result.indexOf(model_result.reduce((a, b) => a > b ? a : b));
      result_index = maxIndex;
      print(model_result);
      print(maxIndex);

// 0: chest press machine
// 1: crunch machine
// 2: hip abduction machine
// 3: incline bench press machine
// 4: lat pull down machine
// 5: leg press machine
// 6: peckdeck fly machine
// 7: seated row machine

      if (result_index == 0) {
        Navigator.pushNamed(context, '/chest');
      } else if (result_index == 1) {
        Navigator.pushNamed(context, '/crunch');
      } else if (result_index == 2) {
        Navigator.pushNamed(context, '/hip');
      } else if (result_index == 3) {
        Navigator.pushNamed(context, '/incline');
      } else if (result_index == 4) {
        Navigator.pushNamed(context, '/latpull');
      } else if (result_index == 5) {
        Navigator.pushNamed(context, '/legpress');
      } else if (result_index == 6) {
        Navigator.pushNamed(context, '/peckdeck');
      } else if(result_index == 7) {
        Navigator.pushNamed(context, '/seated');
      }else{
        Navigator.pushNamed(context, '/g');

      }
    }

  }

  Widget showImage() {
    return Positioned(
      top: 70,
      left: 25,
      child: Container(
          color: Color(0xFFFFFCFC),
          width: 300,
          height: 300,
          child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(File(_image!.path)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF3F3F3),
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
                showImage()
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "사진을 선택해주세요 !",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Color(0xff583DCE),
                  iconSize: 100.0,
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  color: Color(0xff583DCE),
                  iconSize: 100.0,
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ]),
            ],
          ),
        ),
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
                      modelrun();
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
