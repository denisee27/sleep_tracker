import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/QualitySleep.dart';

class SleepResultPage extends StatefulWidget {
  final DateTime? sleepStart;
  SleepResultPage({Key? key, @required this.sleepStart}) : super(key: key);

  @override
  State<SleepResultPage> createState() => _SleepResultPageState();
}

class _SleepResultPageState extends State<SleepResultPage> {
  DateTime? sleepEnd;
  Duration? sleepDuration;
  String? nameUser;

  @override
  void initState() {
    super.initState();
    sleepEnd = DateTime.now();
    getUser();
    calculateSleepDuration();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameUser = prefs.getString("name") ?? "";
    });
  }

  void calculateSleepDuration() {
    setState(() {
      sleepDuration = sleepEnd!.difference(widget.sleepStart!);
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
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
                        "Selamat Pagi, ${nameUser}",
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
                            Text("${formatDuration(sleepDuration!)}",
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
                            Text(
                                "${_formatDateTime(widget.sleepStart!)} - ${_formatDateTime(sleepEnd!)}",
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
                              builder: (context) => QualitySleepPage(
                                    sleep_start: widget.sleepStart,
                                    sleep_end: sleepEnd,
                                  )));
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

String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = (duration.inMinutes - (hours * 60)) % 60;
  return '$hours jam $minutes menit';
}
