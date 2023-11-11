import 'package:flutter/material.dart';
import 'package:sleeptracker_app/pages/result/SleepProfile.dart';

class IntroProfilePage extends StatefulWidget {
  const IntroProfilePage({super.key});

  @override
  State<IntroProfilePage> createState() => _IntroProfilePageState();
}

class _IntroProfilePageState extends State<IntroProfilePage> {
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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sebelum Melanjutkan...",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      )),
                  SizedBox(height: 30),
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
                              "Sleepy Panda bertujuan untuk memberikan edukasi dan informasi. Sleepy Panda berusaha untuk memberikan pemahaman lebih tentang pola tidur kamu. Tetapi, Sleepy Panda bukanlah alat diagnostik atau pengganti konsultasi dengan dokter.",
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
                              "Profil tidur yang disediakan oleh Sleepy Panda berdasarkan data tidur yang kamu berikan, dan bertujuan untuk memberikan rekomendasi terkait pola tidur atau potensi kesehatan.",
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
                              "Kami selalu menyarankan untuk berkonsultasi dengan dokter atau ahli tidur jika mengalami masalah tidur yang serius atau berkelanjutan.",
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
                              "Hasil profil tidur dapat berubah seiring waktu.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300)),
                        )
                      ]),
                ],
              ),
            ),
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
                              'Ya, saya mengerti',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SleepProfile()));
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
