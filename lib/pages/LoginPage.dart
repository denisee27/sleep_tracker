import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/api/ApiServices.dart';
import 'package:sleeptracker_app/pages/FirstPage.dart';
import 'package:sleeptracker_app/pages/HomePage.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/LoginPage.dart';
import 'package:sleeptracker_app/pages/RegisterPage.dart';
import 'package:sleeptracker_app/pages/welcome/WelcomeName.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _isPasswordVisible = false;
  bool loading = false;

  handleLogin() async {
    var response = await ApiServices().loginUser(emailC.text, passwordC.text);
    setState(() {
      loading = false;
    });
    print(response);
    if (response['status'] == 200) {
      if (response['result']['user']['name'] != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(index: 0)));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeName()));
      }
    } else {
      setState(() {
        loading = false;
        Alert(
          context: context,
          type: AlertType.error,
          title: "Login Gagal",
          desc: "Pastikan akun kamu benar dan sudah terdaftar!",
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(32, 34, 63, 1),
        body: Form(
          key: _formKey,
          child: Container(
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
                      "Masuk menggunakan akun yang sudah kamu daftarkan",
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
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
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
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
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
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(39, 46, 73, 1),
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 350,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 15),
                                                    width: 50,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Color.fromRGBO(
                                                            0, 144, 144, 1)),
                                                  ),
                                                  Text(
                                                    "Lupa Password?",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Text(
                                                  'Instruksi untuk melakukan reset password akan dikirim melalui email yang kamu gunakan untuk mendaftar.',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              Container(
                                                width: 350,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              39, 46, 73, 1)),
                                                      controller: emailC,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
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
                                                      decoration:
                                                          InputDecoration(
                                                        // labelText: 'Email',
                                                        hintText: 'Email',
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    39,
                                                                    46,
                                                                    73,
                                                                    1),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    39,
                                                                    46,
                                                                    73,
                                                                    1)),
                                                        floatingLabelStyle:
                                                            TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        39,
                                                                        46,
                                                                        73,
                                                                        1)),
                                                        focusColor:
                                                            Color.fromRGBO(
                                                                39, 46, 73, 1),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        prefixIcon: const Icon(
                                                          Icons.mail_outline,
                                                          color: Color.fromRGBO(
                                                              39, 46, 73, 1),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Color.fromRGBO(0,
                                                                  144, 144, 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Reset Password',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 WelcomeName()));
                                                          // handleLogin();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: !loading
                                ? Text(
                                    'Masuk',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                : SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!loading) {
                              setState(() {
                                loading = true;
                                handleLogin();
                              });
                            }
                          }
                        },
                      ),
                    ),
                    _gap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum Memiliki Akun?",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                            // handleLogin();
                          },
                          child: Text(
                            " Daftar Sekarang",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 144, 144, 1)),
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
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
