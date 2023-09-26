import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loadToken();
    super.initState();
  }

  loadToken() async {
    var token = true;
    // var token = await TokenAccess.getToken();
    if (token != true) {
      Timer(const Duration(seconds: 4),
          () => Navigator.pushReplacementNamed(context, '/home'));
    } else {
      Timer(const Duration(seconds: 4),
          () => Navigator.pushReplacementNamed(context, '/login'));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/images/logo.jpg',
        width: 300,
        height: 340,
      ),
    ));
  }
}
