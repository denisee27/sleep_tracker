import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/PhysicalActivity.dart';

class QualitySleepPage extends StatefulWidget {
  const QualitySleepPage({super.key});

  @override
  State<QualitySleepPage> createState() => _QualitySleepPageState();
}

class _QualitySleepPageState extends State<QualitySleepPage> {
  int? scala;

  handleSubmit() async {
    // bool response = await ApiServices().updateUser(widget.name!, widget.job!,
    //     widget.born!, widget.gender!, weight, widget.height!);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  index: 0,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
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
                          "Kualitas Tidur",
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
                          "Dari skala 1-10, berapa kamu menilai kualitas tidur mu?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 20,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    10,
                    (i) => Container(
                      width: 60,
                      height: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 2.3,
                                color: scala == i + 1
                                    ? Color.fromRGBO(0, 144, 144, 1)
                                    : Color.fromRGBO(39, 46, 73, 1),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromRGBO(39, 46, 73, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Align(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                scala = i + 1;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
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
                        handleSubmit();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
