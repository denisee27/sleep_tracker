import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/QualitySleep.dart';

class SleepResultPage extends StatefulWidget {
  const SleepResultPage({super.key});

  @override
  State<SleepResultPage> createState() => _SleepResultPageState();
}

class _SleepResultPageState extends State<SleepResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Selamat Pagi, Denis",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      )),
                ],
              ),
            ),
            Container(
              height: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 140,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "⏰",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("Durasi Tidur Kamu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200)),
                            Text("7 Jam 2 Menit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),
                    Container(
                      height: 140,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "🌟",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("Waktu Tidur Kamu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200)),
                            Text("21:30 - 06:10",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),
                  ]),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Isi Jurnal Tidur',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QualitySleepPage()));
                      // handleLogin();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
