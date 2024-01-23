import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleeptracker_app/pages/jurnaltidur/DailyPage.dart';
import 'package:sleeptracker_app/pages/jurnaltidur/MonthPage.dart';
import 'package:sleeptracker_app/pages/jurnaltidur/WeekPage.dart';

class JurnalPage extends StatefulWidget {
  const JurnalPage({super.key});

  @override
  State<JurnalPage> createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> with TickerProviderStateMixin {
  DateTime? currentBackPressTime;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> _onBackPressed() {
    if (currentBackPressTime == null || DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Press again to exit'),
        duration: Duration(seconds: 2),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          _onBackPressed().then((value) {
            value == true ? SystemNavigator.pop() : null;
          });

          return false;
        },
        child: Scaffold(
          backgroundColor: Color.fromRGBO(32, 34, 63, 1),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(32, 34, 63, 1),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('Jurnal Tidur'),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(insets: EdgeInsets.symmetric(horizontal: 70.0)),
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.symmetric(vertical: 10),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  child: Text("Daily"),
                ),
                Tab(
                  child: Text("Week"),
                ),
                Tab(
                  child: Text("Month"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const <Widget>[DailyPage(), WeekPage(), MonthPage()],
          ),
        ));
  }
}
