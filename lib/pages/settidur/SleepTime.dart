import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/SleepResult.dart';

class SleepTimePage extends StatefulWidget {
  const SleepTimePage({super.key});

  @override
  State<SleepTimePage> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<SleepTimePage> {
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
                        "Selamat Tidur, Denis",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(children: [
                Container(
                  child: Column(children: [
                    Text(
                      "22:10",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("Waktu Bangun 07:30",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200))
                  ]),
                ),
                Container()
              ]),
            ),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           NumberPicker(
            //             value: _currentValue,
            //             minValue: 0,
            //             maxValue: 500,
            //             onChanged: (value) =>
            //                 setState(() => _currentValue = value),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               border:
            //                   Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
            //             ),
            //             selectedTextStyle: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 25,
            //               color: Colors
            //                   .white, // Ubah warna teks (value) menjadi putih
            //             ),
            //             textStyle: TextStyle(
            //               fontSize: 14,
            //               color: Colors
            //                   .grey, // Ubah warna teks (value) menjadi putih
            //             ),
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             "Cm",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w600),
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 120,
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
                              'Lanjut',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SleepResultPage()));
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
