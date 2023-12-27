import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/SleepSummary.dart';

class SleepTimePage extends StatefulWidget {
  final String? time;
  SleepTimePage({Key? key, @required this.time}) : super(key: key);

  @override
  State<SleepTimePage> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<SleepTimePage> {
  @override
  String? _timeString;
  String? nameUser;
  DateTime? sleepStart;
  late AnimationController _animationController;

  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    sleepStart = DateTime.now();
    getUser();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameUser = prefs.getString("name") ?? "";
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  out() {
    Alert(
        context: context,
        style: AlertStyle(isOverlayTapDismiss: false),
        type: AlertType.warning,
        title: "Jika keluar waktu tidur kamu tidak dapat di record",
        buttons: [
          DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Color(0xff52CD87),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    index: 0,
                  ),
                ),
              )
            },
          ),
          DialogButton(
            child: Text(
              "No",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color(0xffF2416E),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        out();
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 34, 63, 1),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Selamat Tidur, ${nameUser}",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26),
                        )),
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Container(
                    child: Column(children: [
                      Text(
                        _timeString!,
                        style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
                      ),
                      Text("Waktu Bangun ${widget.time}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200))
                    ]),
                  ),
                ]),
              ),
              WaveAnimation(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Wake Up',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SleepResultPage(sleepStart: sleepStart)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: WavePainter(_animationController.value),
            child: Container(),
          );
        },
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double waveHeight = 30.0;
    double speedFactor = 2.0;
    double numberOfWaves = 3.0;

    Path path = Path();

    for (double i = size.width; i >= 0.0; i -= 10.0) {
      double yOffset = sin((i / size.width * numberOfWaves * pi) + (animationValue * 2 * pi * speedFactor)) * waveHeight;

      double waveSizeFactor = 1 + sin((i / size.width * pi));

      double y = size.height / 2 + yOffset * waveSizeFactor;

      if (i == size.width) {
        path.moveTo(i, y);
      } else {
        path.lineTo(i, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
