import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeBorn.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeJob.dart';

class WelcomeGender extends StatefulWidget {
  final String? name;
  WelcomeGender({Key? key, @required this.name}) : super(key: key);

  @override
  State<WelcomeGender> createState() => _WelcomeGenderState();
}

class _WelcomeGenderState extends State<WelcomeGender> {
  int? gender = 0;
  String capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1);
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
                        "Hi ${capitalize(widget.name!)}!",
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
                        "Pilih gender kamu, agar kami bisa mengenal kamu lebih baik",
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
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.3,
                              color: gender == 0
                                  ? Color.fromRGBO(0, 144, 144, 1)
                                  : Color.fromRGBO(39, 46, 73, 1),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(39, 46, 73, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '🙋‍♀️ Wanita',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              gender = 0;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.3,
                              color: gender == 1
                                  ? Color.fromRGBO(0, 144, 144, 1)
                                  : Color.fromRGBO(39, 46, 73, 1),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(39, 46, 73, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '🙋‍♂️ Pria',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              gender = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
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
                              builder: (context) => WelcomeJob(
                                    name: widget.name,
                                  )));
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
