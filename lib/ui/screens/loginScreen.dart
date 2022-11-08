// ignore_for_file: file_names

import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery_technical/data/remoteData/loginRemoteDataSource.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Positioned(
                top: 325,
                left: 20,
                right: 20,
                bottom: 20,
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
                  child: SingleChildScrollView(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4a4a4a)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 285,
                          child: TextField(
                            controller: _userName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 103, 103, 103)),
                                hintText: "User Name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 285,
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 103, 103, 103)),
                                hintText: "Password",
                                fillColor: Colors.white70),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 280,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ))),
                              onPressed: () async {
                                var response = await HttpService().loginUser(
                                    _userName.text.toString(),
                                    _password.text.toString());
                                // var result = await HttpService().getIImages();
                                // var images = result?.data?.images ?? [];
                                // print(images.length);

                                if (response != null) {
                                  // create service too save and retrieve token isloggedin
                                  // navigate
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacementNamed(
                                      context, '/gallery');

                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('name', response.user!.name!);
                                }
                              },
                              child: const Text("Submit",
                                  style: TextStyle(fontSize: 20))),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: -95,
                left: -25,
                height: 267,
                width: 277,
                child: Image.asset('assets/images/Vector2009.png')),
            Positioned(
                top: -109,
                left: -41,
                height: 296,
                width: 310,
                child: Image.asset('assets/images/Vector2010.png')),
            Positioned(
                top: -127,
                left: -58,
                height: 331,
                width: 345,
                child: Image.asset('assets/images/Vector2011.png')),
            Positioned(
                top: -140,
                left: -73,
                height: 358,
                width: 373,
                child: Image.asset('assets/images/Vector2012.png')),
            Positioned(
                top: -82,
                left: -13,
                height: 242,
                width: 252,
                child: Image.asset('assets/images/Vector2013.png')),
            Positioned(
                top: -64,
                left: 7,
                height: 206,
                width: 214,
                child: Image.asset('assets/images/Vector2014.png')),
            Positioned(
                top: 59,
                left: 75,
                height: 132,
                width: 132,
                child: Image.asset('assets/images/loveCamera.png')),
            const Positioned(
                top: 206,
                left: 127,
                height: 121,
                width: 175,
                child: Text(
                  "   My Gallery",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4a4a4a)),
                )),
          ],
        ),
      ),
    );
  }
}
