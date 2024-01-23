import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeptracker_app/api/Token.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/profile/DetailProfilePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
              ),
              radius: 100,
            ),
            SizedBox(
              height: 20,
            ),
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
            //           onTap: () {},
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(39, 46, 73, 1)),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Colors.white,
                              ),
                              _gap(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Detail Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (DetailProfilePage())));
                    },
                  ),
                  _space(),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.description_outlined,
                                color: Colors.white,
                              ),
                              _gap(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Terms & Conditions",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  _space(),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.mode_edit_outlined,
                                color: Colors.white,
                              ),
                              _gap(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Feed Back",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 144, 144, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    onPressed: () {
                      setState(() {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Login Gagal",
                          desc: "Pastikan akun kamu benar dan sudah terdaftar!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            DialogButton(
                              color: Colors.red,
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await TokenAccess.deleteToken();
                                await prefs.remove('id');
                                await prefs.remove('name');
                                await prefs.remove('initials');
                                await prefs.remove('email');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            )
                          ],
                        ).show();
                        return;
                      });
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

  Widget _gap() => const SizedBox(
        width: 10,
      );
  Widget _space() => const SizedBox(
        height: 10,
        width: 250,
        child: Divider(
          color: Colors.white,
          thickness: 0.3,
        ),
      );
}
