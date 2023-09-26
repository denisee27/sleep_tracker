import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeGender.dart';

class WelcomeName extends StatefulWidget {
  const WelcomeName({super.key});

  @override
  State<WelcomeName> createState() => _WelcomeNameState();
}

class _WelcomeNameState extends State<WelcomeName> {
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
                          "Type your name",
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
                    Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: TextFormField(
                          // controller: emailC,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            // filled: true,
                            // fillColor: Color(0xFFE0E0E0)
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
                                builder: (context) => WelcomeGender()));
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
