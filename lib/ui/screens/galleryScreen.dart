// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gallery_technical/data/remoteData/loginRemoteDataSource.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String? token, userName;
  List<dynamic> images = [];
  File? imageFile;
  String? encodedImage;
  String? storedPath;
  String imagePath = '';
  @override
  void initState() {
    getSharedPrefs().whenComplete(() async {
      var result = await HttpService().getIImages();
      images = result?.data?.images ?? [];
    });
    super.initState();
  }

  Future getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = (prefs.getString("token"));
      userName = prefs.getString(("name"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 59,
                left: -197,
                height: 594,
                width: 468,
                child: Image.asset('assets/images/purpleCircle.png')),
            Positioned(
                top: 294,
                left: -50,
                height: 683,
                width: 539,
                child: Image.asset('assets/images/lightCircle.png')),
            Positioned(
                top: -77,
                left: 79,
                height: 683,
                width: 539,
                child: Image.asset('assets/images/greyCircle.png')),
            Positioned(
                bottom: 0,
                height: 414,
                width: 428,
                child: Image.asset('assets/images/bottomGradient.png')),
            Positioned(
                top: 320,
                left: 230,
                height: 147,
                width: 147,
                child: Image.asset('assets/images/Ellipse 33.png')),
            Positioned(
                top: 320,
                left: 240,
                height: 154,
                width: 154,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.asset('assets/images/Ellipse 45.png'))),
            Positioned(
                top: 310,
                left: 210,
                height: 116,
                width: 116,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.asset('assets/images/Ellipse 47.png'))),
            Positioned(
                top: 340,
                left: 53,
                height: 108,
                width: 109,
                child: Image.asset('assets/images/redCard.png')),
            Positioned(
                top: 360,
                left: 79,
                height: 19,
                width: 19,
                child: Image.asset('assets/images/whiteCircle.png')),
            Positioned(
                top: 357,
                left: 62,
                height: 108,
                width: 109,
                child: Image.asset('assets/images/Vector 3.png')),
            Positioned(
                top: 351,
                left: 35,
                height: 108,
                width: 109,
                child: Image.asset('assets/images/Vector 2.png')),
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/Vector.png')),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.white10,
                  child: Text(
                    "Welcome\n$userName",
                    style:
                        const TextStyle(fontSize: 30, color: Color(0xFF4a4a4a)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/images/person.png"),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              left: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCustomDialog(context);
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow,
                      ),
                      child: Center(child: Text('upload')),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.height * 0.01),
              child: FutureBuilder(
                  future: HttpService().getIImages(),
                  builder: (context, snapshot) {
                    // var result = HttpService().getIImages();

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: (images.isEmpty) ? 0 : images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.all(5),
                            //padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: Duration(milliseconds: 800),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          width: 400,
          height: 400,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          String path = await openCamera();
                          await HttpService().uploadImage(path);
                          Navigator.pop(context);
                          await HttpService().getIImages();
                          Navigator.pushReplacementNamed(context, '/gallery');
                        },
                        icon: Icon(Icons.image),
                        label: Text("Camera"))),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          String path = image.path;
                          await HttpService().uploadImage(path);
                          Navigator.pop(context);
                          await HttpService().getIImages();
                          Navigator.pushReplacementNamed(context, '/gallery');
                        }
                      },
                      icon: Icon(Icons.image),
                      label: Text("Gallery")))
            ]),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

openCamera() async {
  final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxHeight: 300,
      maxWidth: 200,
      imageQuality: 90);
  if (image == null) {
    return;
  }
  final Directory directory = await getApplicationDocumentsDirectory();
  final String dir = directory.path;

  final imageTemp = File(image.path);
  final File newImage = await imageTemp.copy('$dir/image1.png');
  print(image.path);
  print(newImage.path.toString());
  final bytes = File(image.path).readAsBytesSync();
  String base64Image = base64Encode(bytes);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("storedImage", newImage.path);
  return image.path;
}
