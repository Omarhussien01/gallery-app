// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gallery_technical/ui/screens/galleryScreen.dart';
import 'package:gallery_technical/ui/screens/loginScreen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery',
      initialRoute: '/login',
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
    if (routeSettings.name == '/splash_screen') {
      //return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    if (routeSettings.name == '/gallery') {
      return MaterialPageRoute(builder: (_) => const GalleryScreen());
    }
    if (routeSettings.name == '/break') {
      //return MaterialPageRoute(builder: (_) => const BreakScreen());
    }
    if (routeSettings.name == '/nav') {
      // return MaterialPageRoute(builder: (_) => BottomBar());
    }
    if (routeSettings.name == '/missions') {
      // return MaterialPageRoute(builder: (_) => MissionScreen());
    }
    if (routeSettings.name == '/excuse') {
      //return MaterialPageRoute(builder: (_) => ExcuseScreen());
    }
    if (routeSettings.name == '/vac') {
      //return MaterialPageRoute(builder: (_) => VacationScreen());
    }
    return null;

    //return MaterialPageRoute(builder: (_) => Home());
  }
}
