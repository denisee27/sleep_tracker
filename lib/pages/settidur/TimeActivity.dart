import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';

class TimeActivityPage extends StatefulWidget {
  const TimeActivityPage({super.key});

  @override
  State<TimeActivityPage> createState() => _TimeActivityPageState();
}

class _TimeActivityPageState extends State<TimeActivityPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController menitC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      body: Form(
        key: _formKey,
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
                          "Aktivitas Fisik",
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
                          "Berapa lama kamu melakukan aktivitas fisik/olahraga?",
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
                        Container(
                          width: 100,
                          height: 70,
                          alignment: Alignment.center,
                          child: Center(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                              controller: menitC,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 46, 73, 1),
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                                focusColor: Colors.white,
                                filled: true,
                                fillColor: Color.fromRGBO(39, 46, 73, 1),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == 0) {
                                  return 'Masukkan Menit Aktivitas Fisik';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Menit",
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
                                'Simpan',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
