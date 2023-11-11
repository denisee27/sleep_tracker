import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';

class SleepProfile extends StatefulWidget {
  const SleepProfile({super.key});

  @override
  State<SleepProfile> createState() => _SleepProfileState();
}

class _SleepProfileState extends State<SleepProfile> {
  @override
  Widget build(BuildContext context) {
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
                    alignment: Alignment.center,
                    child: Text(
                      "Profile Tidur Kamu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 26),
                    )),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(39, 46, 73, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "🚀 Baik",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 26),
                        ),
                      ),
                      _gap(),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                  "Selamat, kamu memiliki profil tidur yang baik! Kamu dapat tidur dengan nyenyak dan tanpa atau dengan sedikit gangguan. Durasi tidur kamu memadai dan berkualitas. Profil tidur baik mengindikasikan kesehatan fisik dan mental yang stabil.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                      _gap(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Saran Untuk Kamu,",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 26),
                        ),
                      ),
                      _gap(),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "✅",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                  "Tetap jaga rutinitas tidur yang konsisten.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "✅",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                  "Memastikan lingkungan tidur mu nyaman, gelap, sejuk, dan tenang.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "✅",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                  "Hindari penggunaan smartphone atau komputer di tempat tidur.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "✅",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                  "Lakukan aktivitas fisik/olahraga secara teratur.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "✅",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                  "Mengatur pola makan yang tepat, hindari makan besar sebelum tidur.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            )
                          ]),
                    ],
                  ),
                ),
              ],
            )),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kembali Ke Jurnal Tidur',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      // handleLogin();
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

Widget _gap() => const SizedBox(height: 16);
