import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/FirstPage.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/SplashPage.dart';
// import 'package:ims_mobile/http.dart';

void main() {
  // HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => SplashPage(),
        '/login': (BuildContext context) => FirstPage(),
        // '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
