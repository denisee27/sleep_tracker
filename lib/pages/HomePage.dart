import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/pages/jurnaltidur/JurnalPage.dart';
import 'package:sleeptracker_app/pages/profile/ProfilePage.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeName.dart';

class HomePage extends StatefulWidget {
  final int? index;
  HomePage({Key? key, @required this.index}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  String? nameUser;
  String? initialsUser;
  String? roleUser;
  String? job_position;
  int countNotif = 0;
  bool searchBox = false;
  bool qrData = false;
  List<String>? warehouse = [];
  bool qrLoading = true;

  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  void initState() {
    activeIndex = widget.index ?? 0;
    pages = [JurnalPage(), WelcomeName(), ProfilePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(39, 46, 73, 1)),
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Icon(
                            Icons.auto_stories_outlined,
                            color: activeIndex == 0
                                ? Color.fromRGBO(255, 199, 84, 1)
                                : Color.fromRGBO(98, 126, 174, 1),
                            size: 30,
                          ),
                          _gapTitle(),
                          Text(
                            "Jurnal Tidur",
                            style: TextStyle(
                                fontSize: 12,
                                color: activeIndex == 0
                                    ? Colors.white
                                    : Color.fromRGBO(98, 126, 174, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  onTap: () => {changeActivePage(0)},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Icon(
                            Icons.dark_mode_rounded,
                            color: activeIndex == 3
                                ? Color.fromRGBO(255, 199, 84, 1)
                                : Color.fromRGBO(98, 126, 174, 1),
                            size: 30,
                          ),
                          _gapTitle(),
                          Text(
                            "Sleep",
                            style: TextStyle(
                                fontSize: 12,
                                color: activeIndex == 3
                                    ? Colors.white
                                    : Color.fromRGBO(98, 126, 174, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  onTap: () => {
                    setState(() {
                      searchBox != false ? searchBox = false : false;
                    }),
                    changeActivePage(3)
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: activeIndex == 2
                                ? Color.fromRGBO(255, 199, 84, 1)
                                : Color.fromRGBO(98, 126, 174, 1),
                            size: 33,
                          ),
                          _gapTitle(),
                          Text(
                            "Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                color: activeIndex == 2
                                    ? Colors.white
                                    : Color.fromRGBO(98, 126, 174, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  onTap: () => {changeActivePage(2)},
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(child: pages[activeIndex]),
      // body: SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   child: Container(
      //     color: Color.fromRGBO(32, 34, 63, 1),
      //     child: CustomScrollView(
      //       slivers: <Widget>[
      //         SliverList(
      //           delegate: SliverChildListDelegate(
      //             [Container(child: pages[activeIndex])],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // )
    );
  }

  Widget _gap() => const SizedBox(height: 5);
  Widget _gapTitle() => const SizedBox(height: 2);
}
