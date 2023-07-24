import 'dart:async';
import 'dart:io';
// import 'dart:js_interop';

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

// class _PicPageState extends State<PicPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(),

//     );
//   }
// }


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

    List<List<List<List<double>>>> fourarray =[];
    fourarray.add(imageArray);

    return fourarray;
  }

    final picker = ImagePicker();


  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);


    setState(() {
      if(image != null){
            _image = File(image!.path); // 가져온 이미지를 _image에 저장

      }else{

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사진을 선택해주세요 !'),
          duration: Duration(seconds: 3),
        ));
      }

    });
  }

    modelrun() async{

      final interpreter = await Interpreter.fromAsset('assets/best_model2.tflite');

        if(_image != null){

            Uint8List imageBytes = File(_image!.path).readAsBytesSync();
            img.Image resizedImage = img.decodeImage(imageBytes)!;
            img.Image image_d = img.copyResize(resizedImage, width: 224, height: 224);
            List<List<List<List<double>>>> imageArray = convertTo3DArray(image_d);

            List<List<double>> output = [[0,0,0,0,0,0,0]];

            interpreter.run(imageArray,output);

            List<double> model_result = output[0];
            int maxIndex = model_result.indexOf(model_result.reduce((a, b) => a > b ? a : b));
            result_index = maxIndex;
            print(model_result);
            print(maxIndex);

if(result_index == 0){
                    Navigator.pushNamed(context, '/chest');

                  }else if(result_index == 1){

                    Navigator.pushNamed(context, '/hip');

                  }else if(result_index == 2){

                    Navigator.pushNamed(context, '/latpull');

                  }else if(result_index == 3){

                    Navigator.pushNamed(context, '/legpress');

                  }else if(result_index == 4){

                    Navigator.pushNamed(context, '/running');

                  }else{
                  Navigator.pushNamed(context, '/f');

                  }
        }{


        }

  }



    Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

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
                height: 80,
              ),
              Text('기구를 촬영해주세요.'),
              showImage()
              ,SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
            icon: Icon(Icons.camera_alt),
            color: Color(0xff1E1651),
            iconSize: 100.0,
            onPressed: () {
                                  getImage(ImageSource.camera);

            },
          ),

                SizedBox(
                  width: 60,
                ),IconButton(
            icon: Icon(Icons.photo),
            color: Color(0xff1E1651),
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
          child: Container(
            color: Color(0xff1E1651),
            child: SizedBox(
              height: 60.0,
              child: TextButton(
                onPressed: (){
                  modelrun();


                },
                child: Text("확인",
                  style: TextStyle(
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






