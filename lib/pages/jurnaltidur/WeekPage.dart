import 'package:flutter/material.dart';
import 'package:sleeptracker_app/models/SleepHistory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({super.key});

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(39, 46, 73, 1)),
              child: Column(
                children: [
                  Text(
                    "Untuk hasil analisa yang lebih baik, akurat, dan bermanfaat. Profil tidur hanya bisa diakses setelah kamu melakukan pelacakan tidur paling tidak 30 hari. ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(0, 144, 144, 1)),
                        child: Text(
                          "Lihat Profile Tidur",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            _spaceV(),
            _spaceH(),
            Column(
              children: [
                Text(
                  "2023",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    _spaceH(),
                    Text(
                      "1 Juni - 7 Juni",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    _spaceH(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            _spaceV(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(39, 46, 73, 1)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("⏰  "),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Average",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Durasi Tidur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "7 Jam 2 Menit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(39, 46, 73, 1)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("⏰  "),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Average",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Durasi Tidur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "7 Jam 2 Menit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            _spaceV(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(39, 46, 73, 1)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("⏰  "),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Average",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Durasi Tidur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "7 Jam 2 Menit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(39, 46, 73, 1)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("⏰  "),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Average",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Durasi Tidur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "7 Jam 2 Menit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: _tooltipBehavior,
                series: <LineSeries<SleepHistory, String>>[
                  LineSeries<SleepHistory, String>(
                      dataSource: <SleepHistory>[
                        SleepHistory('Jan', 35),
                        SleepHistory('Feb', 28),
                        SleepHistory('Mar', 34),
                        SleepHistory('Apr', 32),
                        SleepHistory('May', 40)
                      ],
                      xValueMapper: (SleepHistory sales, _) => sales.year,
                      yValueMapper: (SleepHistory sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])
          ],
        ),
      ),
    );
  }

  Widget _spaceV() => SizedBox(height: 15);
  Widget _spaceH() => SizedBox(width: 15);
}
