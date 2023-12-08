import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/models/JobMaster.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeBorn.dart';

class WelcomeJob extends StatefulWidget {
  final String? name;
  final String? gender;
  WelcomeJob({Key? key, @required this.name, @required this.gender})
      : super(key: key);

  @override
  State<WelcomeJob> createState() => _WelcomeJobState();
}

class _WelcomeJobState extends State<WelcomeJob> {
  String? jobId;
  List<JobMaster> jobMasterList = [];
  ApiServices apiService = ApiServices();
  getJobMaster() async {
    List<JobMaster> response = await apiService.getJobMaster();
    setState(() {
      jobMasterList = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getJobMaster();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) {
      return s[0].toUpperCase() + s.substring(1);
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "HIi ${capitalize(widget.name!)}!",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 26,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Apa pekerjaanmu saat ini?",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 16, left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: Color.fromRGBO(39, 46, 73, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Color.fromRGBO(39, 46, 73, 1), //<-- SEE HERE
                  hint: Text(
                    "Pilih Pekerjaan",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white, // <-- SEE HERE
                  ),
                  isExpanded: true,
                  value: jobId,
                  items: jobMasterList.map((data) {
                    return DropdownMenuItem<String>(
                      value: data.id,
                      child: Text(
                        data.name!,
                        style: TextStyle(color: Colors.white),
                      ), // Menampilkan 'name' di dropdown
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      jobId = value;
                    });
                  },
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
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Lanjut',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeBorn(
                                    name: widget.name,
                                    gender: widget.gender,
                                    job: jobId,
                                  )));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
