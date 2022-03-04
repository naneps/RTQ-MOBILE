// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';

import 'package:tahfidz/model/profil.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: ProfileScreen(
//       telepon: '',
//     ),
//   ));
// }
enum Gender { lakiLaki, perempuan }

class ProfileScreen extends StatefulWidget {
  final String telepon;

  ProfileScreen({required this.telepon});
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _controllerTelepon = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerAlamat = TextEditingController();
  TextEditingController _controllerTeleponLama = TextEditingController();
  TextEditingController _controllerJenisKelamin = TextEditingController();
  TextEditingController _controllerTanggalLahir = TextEditingController();
  TextEditingController _controllerTempatLahir = TextEditingController();

  bool showPassword = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _jenisKelamin = <String>['Laki-laki', 'Perempuan'];

  Gender _gender = Gender.lakiLaki;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.get(Uri.parse(
          'http://rtq-freelance.my.id/api/info_profil/' + widget.telepon));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        _controllerNama.text = jsonResponse['data']['nama'];
        _controllerTelepon.text = jsonResponse['data']['no_hp'];
        _controllerTeleponLama.text = jsonResponse['data']['no_hp'];
        _controllerAlamat.text = jsonResponse['data']['alamat'];
        _controllerJenisKelamin.text = jsonResponse['data']['alamat'];
        _controllerTanggalLahir.text = jsonResponse['data']['alamat'];
        _controllerTempatLahir.text = jsonResponse['data']['alamat'];
      } else {
        dataFailed();
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Get.back();
              }),
          title: Text(
            "Profil",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: widthBody,
                height: heightBody / 3.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: widthBody,
                        height: 145,
                        // margin: EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(90.0),
                            bottomLeft: Radius.circular(90.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        child: Card(
                          elevation: 5,
                          shape: CircleBorder(),
                          child: ProfilePicture(
                            sizeAvatar: 150,
                            // sizeBtn: 0,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                // color: mainColor,
                width: widthBody,
                height: heightBody / 2,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  // reverse: true,
                  physics: FixedExtentScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // buildRadioGender(),
                        buildTextField("Nama", _controllerNama.text, false,
                            false, _controllerNama),
                        buildTextField("Telepon", _controllerTelepon.text,
                            false, false, _controllerTelepon),
                        buildTextField("Alamat", _controllerAlamat.text, false,
                            false, _controllerAlamat),
                        buildTextField(
                            "Tanggal Lahir",
                            _controllerTanggalLahir.text,
                            false,
                            false,
                            _controllerTanggalLahir),
                        buildTextField(
                            "Tempat Lahir",
                            _controllerTempatLahir.text,
                            false,
                            false,
                            _controllerTempatLahir),
                        // example(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlineButton(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Batal",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print("ini simpan");
                              },
                              color: mainColor,
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Simpan",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildDropDownField(double widthBody) {
  //   return Container(
  //     padding: EdgeInsets.only(bottom: 35.0),
  //     width: widthBody,
  //     child: Column(children: <Widget>[
  //       Container(
  //         child: DropdownButton(
  //             value: _gender,
  //             items: _jenisKelamin.map((value) {
  //               return DropdownMenuItem(
  //                 child: Text(value),
  //                 value: value,
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               setState(() {
  //                 _gender = value as String?;
  //               });
  //             }),
  //       )
  //     ]),
  //   );
  // }

  Widget buildRadioGender() {
    return Wrap(
      alignment: WrapAlignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        ListTile(
          title: const Text('Laki-Laki'),
          leading: Radio<Gender>(
            value: Gender.lakiLaki,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Perempuan'),
          leading: Radio<Gender>(
            value: Gender.perempuan,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, bool type, dynamic controller) {
    final typekey = TextInputType.number;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,

        obscureText: isPasswordTextField ? showPassword : false,
        // ignore: dead_code
        keyboardType: (type == true) ? typekey : null,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  void dataFailed() {
    Fluttertoast.showToast(
        msg: "Data gagal diambil!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
