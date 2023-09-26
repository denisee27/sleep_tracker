import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker_app/pages/RegisterPage.dart';
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
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: 300,
                    height: 140,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _gap(),
                      TextFormField(
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
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          // filled: true,
                          // fillColor: Color(0xFFE0E0E0)
                        ),
                      ),
                      _gap(),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
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
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              // filled: true,
                              // fillColor: Color(0xFFE0E0E0),
                              // prefixIcon:
                              //     const Icon(Icons.lock_outline_rounded),
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
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
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                            onTap: () => "https://www.google.com",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign in',
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
                ),
                _gap(),
                SizedBox(
                  width: 400,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        "Don't have an account yet? Sign Up Here",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage())),
                    ),
                  ),
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
