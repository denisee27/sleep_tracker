import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/settidur/PhysicalActivity.dart';

class QualitySleepPage extends StatefulWidget {
  final DateTime? sleep_start;
  final DateTime? sleep_end;
  QualitySleepPage(
      {Key? key, @required this.sleep_start, @required this.sleep_end})
      : super(key: key);

  @override
  State<QualitySleepPage> createState() => _QualitySleepPageState();
}

class _QualitySleepPageState extends State<QualitySleepPage> {
  int? sleep_quality;
  bool loading = false;
  handleSubmit() async {
    bool response = await ApiServices()
        .createSleep(widget.sleep_start!, widget.sleep_end!, sleep_quality!);
    setState(() {
      loading = false;
    });
    if (response == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    index: 0,
                  )));
      return;
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Submit Gagal",
        desc: "Pastikan data yang di input sudah benar",
        buttons: [
          DialogButton(
            child: Text(
              "Oke",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ).show();
      return;
    }
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
                                color: sleep_quality == i + 1
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
                                sleep_quality = i + 1;
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
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: !loading
                              ? Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))),
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
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
