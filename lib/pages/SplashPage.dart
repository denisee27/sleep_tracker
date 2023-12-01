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
          () => Navigator.pushReplacementNamed(context, '/first'));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(32, 34, 63, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Center(
                child: Text(
              "Sleepy Panda",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ));
  }
}
