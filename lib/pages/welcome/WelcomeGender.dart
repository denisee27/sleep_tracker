import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeBorn.dart';

class WelcomeGender extends StatefulWidget {
  const WelcomeGender({super.key});

  @override
  State<WelcomeGender> createState() => _WelcomeGenderState();
}

class _WelcomeGenderState extends State<WelcomeGender> {
  int? gender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          "Choose Gender",
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
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  gender == 0 ? Colors.white : Colors.blue[900],
                              backgroundColor: gender == 0
                                  ? Colors.blue[900]
                                  : Colors.blue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '🙋‍♀️ Female',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                              foregroundColor:
                                  gender == 1 ? Colors.white : Colors.blue[900],
                              backgroundColor: gender == 1
                                  ? Colors.blue[900]
                                  : Colors.blue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '🙋‍♂️ Female',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                builder: (context) => WelcomeBorn()));
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
