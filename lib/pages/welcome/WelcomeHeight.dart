import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class WelcomeHeight extends StatefulWidget {
  const WelcomeHeight({super.key});

  @override
  State<WelcomeHeight> createState() => _WelcomeHeightState();
}

class _WelcomeHeightState extends State<WelcomeHeight> {
  int _currentValue = 100;

  Future<void> _showDoubleDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
          // title: Text('Choose Height'),
          content: new NumberPicker(
            value: _currentValue,
            minValue: 50,
            maxValue: 300,
            step: 10,
            onChanged: (value) => setState(() => _currentValue = value),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: 800,
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Column(
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
                          "Choose Height",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ),
              Container(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                "165",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )),
                          onTap: () {
                            _showDoubleDialog();
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cm",
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
                                'Next',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeHeight()));
                        // handleLogin();
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
