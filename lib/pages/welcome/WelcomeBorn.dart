import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:intl/intl.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeHeight.dart';

class WelcomeBorn extends StatefulWidget {
  const WelcomeBorn({super.key});

  @override
  State<WelcomeBorn> createState() => _WelcomeBornState();
}

class _WelcomeBornState extends State<WelcomeBorn> {
  TextEditingController creationDateC = TextEditingController();

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
                          "Choose Born Of Date",
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
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: creationDateC,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: 'Choose Date',
                          labelText: 'Creation Date',
                        ),
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          final dateFormat = DateFormat('dd/MM/yyyy');
                          creationDateC.text = dateFormat.format(picked!);
                        },
                      ),
                    ),
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
