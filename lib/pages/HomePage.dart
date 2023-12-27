import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleeptracker_app/pages/jurnaltidur/JurnalPage.dart';
import 'package:sleeptracker_app/pages/profile/ProfilePage.dart';
import 'package:sleeptracker_app/pages/settidur/SleepTime.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeName.dart';

class HomePage extends StatefulWidget {
  final int? index;
  HomePage({Key? key, @required this.index}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  int hour = 0;
  int minute = 0;

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
                            color: activeIndex == 0 ? Color.fromRGBO(255, 199, 84, 1) : Color.fromRGBO(98, 126, 174, 1),
                            size: 30,
                          ),
                          _gapTitle(),
                          Text(
                            "Jurnal Tidur",
                            style: TextStyle(
                                fontSize: 12, color: activeIndex == 0 ? Colors.white : Color.fromRGBO(98, 126, 174, 1), fontWeight: FontWeight.bold),
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
                            color: activeIndex == 3 ? Color.fromRGBO(255, 199, 84, 1) : Color.fromRGBO(98, 126, 174, 1),
                            size: 30,
                          ),
                          _gapTitle(),
                          Text(
                            "Sleep",
                            style: TextStyle(
                                fontSize: 12, color: activeIndex == 3 ? Colors.white : Color.fromRGBO(98, 126, 174, 1), fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  onTap: () => {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      backgroundColor: Color.fromRGBO(39, 46, 73, 1), // <-- SEE HERE
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "Pilih Waktu Bangun Tidurmu",
                                            style: TextStyle(color: Colors.white, fontSize: 21),
                                          ),
                                        ),
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
                                            StatefulBuilder(builder: (context4, setState2) {
                                              return NumberPicker(
                                                itemHeight: 90,
                                                itemWidth: 120,
                                                value: hour,
                                                minValue: 0,
                                                maxValue: 23,
                                                onChanged: (value) => setState2(() => hour = value),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
                                                ),
                                                selectedTextStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50,
                                                  color: Colors.white, // Ubah warna teks (value) menjadi putih
                                                ),
                                                textStyle: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.grey, // Ubah warna teks (value) menjadi putih
                                                ),
                                              );
                                            }),
                                            Text(
                                              " : ",
                                              style: TextStyle(color: Colors.white, fontSize: 50),
                                            ),
                                            StatefulBuilder(builder: (context4, setState2) {
                                              return NumberPicker(
                                                itemHeight: 90,
                                                itemWidth: 120,
                                                value: minute,
                                                minValue: 00,
                                                maxValue: 59,
                                                onChanged: (value) => setState2(() => minute = value),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Color.fromRGBO(0, 144, 144, 1)),
                                                ),
                                                selectedTextStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50,
                                                  color: Colors.white, // Ubah warna teks (value) menjadi putih
                                                ),
                                                textStyle: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.grey, // Ubah warna teks (value) menjadi putih
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Waktu tidur ideal yang cukup adalah selama ",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              TextSpan(
                                                text: "8 jam",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 400,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Tidur Sekarang',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                            onPressed: () {
                                              TimeOfDay selectedTime = TimeOfDay(hour: hour, minute: minute);
                                              String formattedTime = selectedTime.format(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => SleepTimePage(time: formattedTime)));
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          child: Text(
                                            "Nanti Saja",
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    // setState(() {
                    //   searchBox != false ? searchBox = false : false;
                    // }),
                    // changeActivePage(3)
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
                            color: activeIndex == 2 ? Color.fromRGBO(255, 199, 84, 1) : Color.fromRGBO(98, 126, 174, 1),
                            size: 33,
                          ),
                          _gapTitle(),
                          Text(
                            "Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11, color: activeIndex == 2 ? Colors.white : Color.fromRGBO(98, 126, 174, 1), fontWeight: FontWeight.bold),
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
