import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';

class SetupTidurPage extends StatefulWidget {
  const SetupTidurPage({super.key});

  @override
  State<SetupTidurPage> createState() => _SetupTidurPageState();
}

class _SetupTidurPageState extends State<SetupTidurPage> {
  int hour = 00;
  int minute = 00;

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
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Pilih Waktu Bangun Tidurmu",
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        itemHeight: 90,
                        itemWidth: 120,
                        value: hour,
                        minValue: 00,
                        maxValue: 23,
                        onChanged: (value) => setState(() => hour = value),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
                        ),
                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors
                              .white, // Ubah warna teks (value) menjadi putih
                        ),
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors
                              .grey, // Ubah warna teks (value) menjadi putih
                        ),
                      ),
                      Text(
                        " : ",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      NumberPicker(
                        itemHeight: 90,
                        itemWidth: 120,
                        value: minute,
                        minValue: 00,
                        maxValue: 59,
                        onChanged: (value) => setState(() => minute = value),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
                        ),
                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors
                              .white, // Ubah warna teks (value) menjadi putih
                        ),
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors
                              .grey, // Ubah warna teks (value) menjadi putih
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Waktu tidur ideal yang cukup adalah selama ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "8 jam",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Tidur Sekarang',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => WelcomeName()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Text(
                      "Nanti Saja",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
