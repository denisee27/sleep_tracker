import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/RegisterPage.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeName.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _isPasswordVisible = false;

  handleLogin() async {
    if (emailC.text == '' || passwordC.text == '') {
      setState(() {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Email/NIP dan password tidak boleh kosong!",
          buttons: [
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ).show();
        return;
      });
    } else {
      bool response = false;

      // bool response =
      //     await ApiServices().loginUser(emailC.text, passwordC.text);
      if (response == true) {
        Navigator.of(context).pushNamed('/home');
      } else {
        setState(() {
          Alert(
            context: context,
            type: AlertType.error,
            title: "Login Filed",
            desc: "Make sure your account is registered and correct",
            buttons: [
              DialogButton(
                child: Text(
                  "Oke",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ).show();
          return;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 34, 63, 1),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Center(
                      child: Text(
                    "Sleepy Panda",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              // Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: Text(
                      "Mulai dengan masuk atau mendaftar untuk melihat analisa tidur mu.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        // handleLogin();
                      },
                    ),
                  ),
                  _gap(),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 144, 144, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                        // handleLogin();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
