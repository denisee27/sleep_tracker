import 'package:flutter/material.dart';
import 'package:sleeptracker_app/models/SleepHistory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key});

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  TooltipBehavior? _tooltipMulaiTidur;
  TooltipBehavior? _tooltipBangunTidur;
  late TrackballBehavior _trackballBehavior;
  late CrosshairBehavior _crosshairBehavior;

  final List<MulaiTidur> dataMulaiTidur = <MulaiTidur>[
    MulaiTidur(2010, 10.53, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2011, 9.5, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2012, 10, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2013, 9.4, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2014, 5.8, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2015, 4.9, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2016, 4.5, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2017, 3.6, Color.fromRGBO(255, 89, 153, 1)),
    MulaiTidur(2018, 3.43, Color.fromRGBO(255, 89, 153, 1)),
  ];

  final List<BangunTidur> dataBangunTidur = <BangunTidur>[
    BangunTidur(2010, 10.53, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2011, 9.5, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2012, 10, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2013, 9.4, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2014, 5.8, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2015, 4.9, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2016, 4.5, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2017, 3.6, Color.fromRGBO(255, 199, 84, 1)),
    BangunTidur(2018, 3.43, Color.fromRGBO(255, 199, 84, 1)),
  ];

  @override
  void initState() {
    _tooltipMulaiTidur = TooltipBehavior(
      enable: true,
      header: 'Mulai Tidur',
      // format: 'point.y',
    );
    _tooltipBangunTidur = TooltipBehavior(
      enable: true,
      header: 'Bangun Tidur',
      // format: 'point.y',
    );
    _trackballBehavior = TrackballBehavior(enable: true);

    super.initState();
  }

  // @override
  // void initState() {
  //   _tooltipBehavior = TooltipBehavior(enable: true);
  //   super.initState();
  // }

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
            Container(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "2023",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 15),
                      // _spaceH(),
                      Text(
                        "Juni",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      // _spaceH(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: SfCartesianChart(
                primaryXAxis:
                    NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                primaryYAxis:
                    NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                tooltipBehavior: _tooltipMulaiTidur,
                enableAxisAnimation: true,
                title: ChartTitle(
                    alignment: ChartAlignment.near,
                    text: 'Mulai Tidur',
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                // primaryXAxis: NumericAxis(isInversed: true),
                // primaryYAxis: NumericAxis(isInversed: true),
                series: <ChartSeries>[
                  LineSeries<MulaiTidur, double>(
                      dataSource: dataMulaiTidur,
                      enableTooltip: true,
                      // dataLabelSettings: DataLabelSettings(
                      //     isVisible: true,
                      //     textStyle: TextStyle(color: Colors.white)),
                      pointColorMapper: (MulaiTidur data, _) => data.color,
                      markerSettings: MarkerSettings(isVisible: true),
                      xValueMapper: (MulaiTidur data, _) => data.x,
                      yValueMapper: (MulaiTidur data, _) => data.y),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SfCartesianChart(
                primaryXAxis:
                    NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                primaryYAxis:
                    NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                tooltipBehavior: _tooltipBangunTidur,
                enableAxisAnimation: true,
                title: ChartTitle(
                    alignment: ChartAlignment.near,
                    text: 'Bangun Tidur',
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                // primaryXAxis: NumericAxis(isInversed: true),
                // primaryYAxis: NumericAxis(isInversed: true),
                series: <ChartSeries>[
                  LineSeries<BangunTidur, double>(
                      dataSource: dataBangunTidur,
                      enableTooltip: true,
                      // dataLabelSettings: DataLabelSettings(
                      //     isVisible: true,
                      //     textStyle: TextStyle(color: Colors.white)),
                      pointColorMapper: (BangunTidur data, _) => data.color,
                      markerSettings: MarkerSettings(isVisible: true),
                      xValueMapper: (BangunTidur data, _) => data.x,
                      yValueMapper: (BangunTidur data, _) => data.y),
                ],
              ),
            )

            // SfCartesianChart(
            //     primaryXAxis: CategoryAxis(),
            //     // Chart title
            //     title: ChartTitle(text: 'Half yearly sales analysis'),
            //     // Enable legend
            //     // Enable tooltip
            //     tooltipBehavior: _tooltipBehavior,
            //     series: <LineSeries<SleepHistory, String>>[
            //       LineSeries<SleepHistory, String>(
            //           dataSource: <SleepHistory>[
            //             SleepHistory('Jan', 35),
            //             SleepHistory('Feb', 28),
            //             SleepHistory('Mar', 34),
            //             SleepHistory('Apr', 32),
            //             SleepHistory('May', 40)
            //           ],
            //           xValueMapper: (SleepHistory sales, _) => sales.year,
            //           yValueMapper: (SleepHistory sales, _) => sales.sales,
            //           // Enable data label
            //           dataLabelSettings: DataLabelSettings(isVisible: true))
            //     ])
          ],
        ),
      ),
    );
  }

  Widget _spaceV() => SizedBox(height: 15);
  Widget _spaceH() => SizedBox(width: 15);
}
