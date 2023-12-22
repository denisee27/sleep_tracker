import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/models/DailySleep.dart';
import 'package:sleeptracker_app/pages/result/intro.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  List<DailySleep> dailySleep = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    getDailySleep();
  }

  getDailySleep() async {
    List<DailySleep> response = await ApiServices().getDailySleep();
    setState(() {
      dailySleep = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? SingleChildScrollView(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: dailySleep.isNotEmpty
                ? Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: const Color.fromRGBO(39, 46, 73, 1)),
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         "Untuk hasil analisa yang lebih baik, akurat, dan bermanfaat. Profil tidur hanya bisa diakses setelah kamu melakukan pelacakan tidur paling tidak 30 hari. ",
                      //         style: TextStyle(
                      //             color: Colors.white, fontWeight: FontWeight.w300),
                      //       ),
                      //       SizedBox(
                      //         height: 15,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.bottomRight,
                      //         child: InkWell(
                      //           child: Container(
                      //             padding:
                      //                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Color.fromRGBO(0, 144, 144, 1)),
                      //             child: Text(
                      //               "Lihat Profile Tidur",
                      //               style: TextStyle(
                      //                   color: Colors.white, fontWeight: FontWeight.w300),
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) => IntroProfilePage()));
                      //           },
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      for (int i = 0; i < dailySleep.length; i++) ...[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  (DateFormat("dd MMMM y").format(DateTime.parse(dailySleep.elementAt(i).createdAt!))),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("⏰ "),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Durasi Tidur",
                                                style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                              ),
                                              Text(
                                                formatDuration(dailySleep.elementAt(i).sleepStart!, dailySleep.elementAt(i).sleepEnd!),
                                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("🌟 "),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Waktu Tidur",
                                                style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                              ),
                                              Text(
                                                "${DateFormat("HH:mm").format(DateTime.parse(dailySleep.elementAt(i).sleepStart!))} - ${DateFormat("HH:mm").format(DateTime.parse(dailySleep.elementAt(i).sleepEnd!))}",
                                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ]
                    ],
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              DateFormat('dd MMMM y').format(DateTime.now()),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("⏰ "),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Durasi Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "0 Jam 0 Menit",
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("🌟 "),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Waktu Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "-- : -- - -- : --",
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ))
        : Center(
            child: LoadingAnimationWidget.waveDots(
            color: Colors.white,
            size: 80,
          ));
  }
}

String formatDuration(String start, String end) {
  DateTime sleepStart = DateFormat("yyyy-MM-dd HH:mm").parse(start);
  DateTime sleepEnd = DateFormat("yyyy-MM-dd HH:mm").parse(end);
  Duration sleepDuration = sleepEnd.difference(sleepStart);
  int hours = sleepDuration.inHours;
  int minutes = (sleepDuration.inMinutes - (hours * 60)) % 60;
  return '$hours jam $minutes menit';
}
