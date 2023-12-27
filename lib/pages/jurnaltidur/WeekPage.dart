import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/models/SleepHistory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({super.key});

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  SleepSummary? weekSleep;
  bool loading = false;
  DateTime? currentDate;
  final int daysToShow = 7;

  late TooltipBehavior _tooltipMulaiTidur;
  late TooltipBehavior _tooltipBangunTidur;
  late TooltipBehavior _tooltipDurasiTidur;
  late SelectionBehavior _selectionBehaviorDuratiTidur;

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

  final List<DurasiTidur> dataDurasiTidur = <DurasiTidur>[
    DurasiTidur(DateTime(2023, 12, 4), 30, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 5), 34, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 6), 30, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 7), 30, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 8), 35, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 9), 35, Color.fromRGBO(227, 81, 89, 1)),
    DurasiTidur(DateTime(2023, 12, 10), 35, Color.fromRGBO(227, 81, 89, 1)),
  ];

  @override
  void initState() {
    super.initState();
    loading = true;
    getData();
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
    _selectionBehaviorDuratiTidur =
        SelectionBehavior(enable: true, selectedColor: Color.fromRGBO(227, 81, 89, 1), unselectedColor: Color.fromRGBO(96, 53, 74, 1));
    _tooltipDurasiTidur = TooltipBehavior(
      enable: true,
      tooltipPosition: TooltipPosition.pointer,
      format: 'point.y',
      header: 'Durasi Tidur',
    );
    currentDate = DateTime.now();
  }

  getData() async {
    SleepSummary response = await ApiServices().getWeekSleep();
    setState(() {
      weekSleep = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime _calculateStartDate() {
      return currentDate!.subtract(Duration(days: daysToShow));
    }

    void _updateDate(bool isIncrement) {
      setState(() {
        currentDate = isIncrement ? currentDate!.add(Duration(days: daysToShow)) : currentDate!.subtract(Duration(days: daysToShow));
      });
    }

    return !loading
        ? SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
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
                  Column(
                    children: [
                      Center(
                        child: Text(
                          (DateFormat("y").format(currentDate!)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  _updateDate(false);
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.width,
                                    width: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 15))),
                            _spaceH(),
                            Text(
                              "${DateFormat("d MMM").format(_calculateStartDate())} - ${DateFormat("d MMM").format(currentDate!)}",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            _spaceH(),
                            InkWell(
                              onTap: () {
                                _updateDate(true);
                              },
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                height: MediaQuery.of(context).size.width,
                                width: 50,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
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
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "Durasi Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "${formatDuration(weekSleep!.averageDuration!.result!)}",
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
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
                      ),
                      _spaceH(),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("🌟  "),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "Durasi Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                formatDuration(weekSleep!.totalDuration!.result!),
                                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  _spaceV(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("🛌  "),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Average",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "Mulai Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "${DateFormat("HH:mm").format(weekSleep!.averageSleep!.averageTime!)}",
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
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
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(39, 46, 73, 1)),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("🌞  "),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Average",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "Bangun Tidur",
                                            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                                          ),
                                          Text(
                                            "${DateFormat('HH:mm').format(weekSleep!.averageWake!.averageTime!)}",
                                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
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
                      )
                    ],
                  ),
                  _spaceV(),
                  Container(
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipDurasiTidur,
                        primaryXAxis: DateTimeAxis(
                            axisLabelFormatter: (axisLabelRenderArgs) {
                              final String text = DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(axisLabelRenderArgs.value.toInt()));
                              const TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.w400);
                              return ChartAxisLabel(text, style);
                            },
                            majorGridLines: MajorGridLines(width: 0),
                            minorTicksPerInterval: 0),
                        primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), decimalPlaces: 0, interval: 2),
                        title: ChartTitle(
                            alignment: ChartAlignment.near,
                            text: 'Durasi Tidur',
                            textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                        series: <ChartSeries>[
                          ColumnSeries<DurasiTidur, DateTime>(
                              dataSource: dataDurasiTidur,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              selectionBehavior: _selectionBehaviorDuratiTidur,
                              pointColorMapper: (DurasiTidur data, _) => data.color,
                              xValueMapper: (DurasiTidur data, _) => data.x,
                              yValueMapper: (DurasiTidur data, _) => data.y)
                        ]),
                  ),
                  _spaceV(),
                  Container(
                    child: SfCartesianChart(
                      primaryXAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                      primaryYAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                      tooltipBehavior: _tooltipMulaiTidur,
                      enableAxisAnimation: true,
                      title: ChartTitle(
                          alignment: ChartAlignment.near,
                          text: 'Mulai Tidur',
                          textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
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
                  _spaceV(),
                  Container(
                    child: SfCartesianChart(
                      primaryXAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                      primaryYAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
                      tooltipBehavior: _tooltipBangunTidur,
                      enableAxisAnimation: true,
                      title: ChartTitle(
                          alignment: ChartAlignment.near,
                          text: 'Bangun Tidur',
                          textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
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
                  ),

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
          )
        : Center(
            child: LoadingAnimationWidget.waveDots(
            color: Colors.white,
            size: 80,
          ));
    ;
  }

  Widget _spaceV() => SizedBox(height: 15);
  Widget _spaceH() => SizedBox(width: 15);

  String formatDuration(double duration) {
    int hours = duration.toInt();
    int minutes = ((duration - hours) * 60).toInt();

    return '$hours jam $minutes menit';
  }
}
