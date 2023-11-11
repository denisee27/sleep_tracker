import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/TimeActivity.dart';

class PhysicalActivityPage extends StatefulWidget {
  const PhysicalActivityPage({super.key});

  @override
  State<PhysicalActivityPage> createState() => PhysicalActivityPageState();
}

class PhysicalActivityPageState extends State<PhysicalActivityPage> {
  int? activity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Aktivitas Fisik",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Apakah kamu melakukan aktivitas fisik/olahraga kemarin?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.3,
                              color: activity == 0
                                  ? Color.fromRGBO(0, 144, 144, 1)
                                  : Color.fromRGBO(39, 46, 73, 1),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(39, 46, 73, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "🥱 Tidak",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              activity = 0;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.3,
                              color: activity == 1
                                  ? Color.fromRGBO(0, 144, 144, 1)
                                  : Color.fromRGBO(39, 46, 73, 1),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(39, 46, 73, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "🏋️‍♂️ Ya",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              activity = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: activity == 1 ? 120 : null,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              activity == 1 ? "Lanjut" : "Simpan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => activity == 1
                                  ? TimeActivityPage()
                                  : HomePage()));
                      // handleLogin();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
