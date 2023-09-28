import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
    pages = [
      WelcomeName(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
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
                              Icons.home_filled,
                              color: activeIndex == 0
                                  ? Colors.blue[900]
                                  : Colors.grey[600],
                            ),
                            _gapTitle(),
                            Text(
                              "Beranda",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: activeIndex == 0
                                      ? Colors.blue[900]
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onTap: () => {
                      setState(() {
                        searchBox != false ? searchBox = false : false;
                      }),
                      changeActivePage(0)
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
                              Icons.move_to_inbox_rounded,
                              color: activeIndex == 1
                                  ? Colors.blue[900]
                                  : Colors.grey[600],
                            ),
                            Text(
                              "Transfer Material",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: activeIndex == 1
                                      ? Colors.blue[900]
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onTap: () => {
                      setState(() {
                        searchBox != false ? searchBox = false : false;
                      }),
                      changeActivePage(1),
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[900],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.outbox_outlined,
                            color: Colors.white,
                          ),
                        )),
                    onTap: () => {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Icon(
                              Icons.pending_actions_rounded,
                              color: activeIndex == 3
                                  ? Colors.blue[900]
                                  : Colors.grey[600],
                            ),
                            _gapTitle(),
                            Text(
                              "History",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: activeIndex == 3
                                      ? Colors.blue[900]
                                      : Colors.grey[600],
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
                              Icons.assignment_return_outlined,
                              color: activeIndex == 4
                                  ? Colors.blue[900]
                                  : Colors.grey[600],
                            ),
                            _gapTitle(),
                            Text(
                              "Material Return",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: activeIndex == 4
                                      ? Colors.blue[900]
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onTap: () => {
                      setState(() {
                        searchBox != false ? searchBox = false : false;
                      }),
                      changeActivePage(4)
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.grey[100],
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  forceElevated: true, //* here
                  elevation: 3, //* question having 0 here
                  shadowColor: Colors.black,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [Container(child: pages[activeIndex])],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _gap() => const SizedBox(height: 5);
  Widget _gapTitle() => const SizedBox(height: 2);
}
