import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeName.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        resizeToAvoidBottomInset: false,
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
                    "Daftar menggunakan email yang valid",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  )),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _gap(),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailC,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            bool _emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!_emailValid) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(39, 46, 73, 1),
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            floatingLabelStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            filled: true,
                            fillColor: Color.fromRGBO(39, 46, 73, 1),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        _gap(),
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: passwordC,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 46, 73, 1),
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                                floatingLabelStyle:
                                    TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                filled: true,
                                fillColor: Color.fromRGBO(39, 46, 73, 1),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                )),
                          ),
                        ),
                        _gap(),
                        SizedBox(
                          width: 400,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                "Lupa Password ?",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 144, 144, 1)),
                              ),
                              onTap: () => "https://www.google.com",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                                builder: (context) => WelcomeName()));
                        // handleLogin();
                      },
                    ),
                  ),
                  _gap(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah Memiliki Akun?",
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Masuk Sekarang",
                          style:
                              TextStyle(color: Color.fromRGBO(0, 144, 144, 1)),
                        ),
                      )
                    ],
                  )
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
