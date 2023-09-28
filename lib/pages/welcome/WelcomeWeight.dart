import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';

class WelcomeWeight extends StatefulWidget {
  const WelcomeWeight({super.key});

  @override
  State<WelcomeWeight> createState() => _WelcomeWeightState();
}

class _WelcomeWeightState extends State<WelcomeWeight> {
  int _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Welcome To Sleepify",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 26),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Choose Weight",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
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
                        value: _currentValue,
                        minValue: 0,
                        maxValue: 200,
                        onChanged: (value) =>
                            setState(() => _currentValue = value),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Kg",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.save)
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
