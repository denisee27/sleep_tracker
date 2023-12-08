import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';

class WelcomeWeight extends StatefulWidget {
  final String? name;
  final String? gender;
  final String? job;
  final String? born;
  final int? height;
  WelcomeWeight(
      {Key? key,
      @required this.name,
      @required this.gender,
      @required this.job,
      @required this.born,
      @required this.height})
      : super(key: key);

  @override
  State<WelcomeWeight> createState() => _WelcomeWeightState();
}

class _WelcomeWeightState extends State<WelcomeWeight> {
  int weight = 50;
  String? id;

  handleSubmit() async {
    bool response = await ApiServices().updateUser(widget.name!, widget.job!,
        widget.born!, widget.gender!, weight, widget.height!);
    if (response == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    index: 0,
                  )));
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Gagal",
        desc: "Pastikan data yang dimasukkan valid!",
        buttons: [
          DialogButton(
            child: Text(
              "Oke",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ).show();
    }
  }

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString("id") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

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
                        "Terakhir,",
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
                        "Berapa berat badanmu?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ))
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
                        value: weight,
                        minValue: 0,
                        maxValue: 500,
                        onChanged: (value) => setState(() => weight = value),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
                        ),
                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors
                              .white, // Ubah warna teks (value) menjadi putih
                        ),
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors
                              .grey, // Ubah warna teks (value) menjadi putih
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Cm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
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
                      setState(() {
                        // print(widget.born!);
                        handleSubmit();
                      });
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
