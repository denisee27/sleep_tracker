import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailProfilePage extends StatefulWidget {
  const DetailProfilePage({super.key});

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  TextEditingController bornDateC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 34, 63, 1),
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(32, 34, 63, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        'https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.edit,
                              color: Color.fromRGBO(0, 144, 144, 1)),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                50,
                              ),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      // controller: emailC,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(39, 46, 73, 1),
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Color.fromRGBO(39, 46, 73, 1),
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                _space(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      // controller: emailC,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(39, 46, 73, 1),
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Color.fromRGBO(39, 46, 73, 1),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                _space(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      // controller: emailC,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(39, 46, 73, 1),
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        filled: true,
                        fillColor: Color.fromRGBO(39, 46, 73, 1),
                        prefixIcon: const Icon(
                          Icons.transgender_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                _space(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date Of Birth",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: bornDateC,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(39, 46, 73, 1),
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        filled: true,
                        fillColor: Color.fromRGBO(39, 46, 73, 1),
                        prefixIcon: const Icon(
                          Icons.event_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        final dateFormat = DateFormat('dd MMM yyyy');
                        bornDateC.text = dateFormat.format(picked!);
                      },
                    ),
                  ],
                ),
                _space(),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 144, 144, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ()));
                          // handleLogin();
                        },
                      ),
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

  Widget _gap() => const SizedBox(
        height: 5,
      );
  Widget _space() => const SizedBox(
        height: 20,
      );
}
