// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';

import 'package:tahfidz/model/profil.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: ProfileScreen(
      telepon: '',
    ),
  ));
}

class ProfileScreen extends StatefulWidget {
  final String telepon;
  ProfileScreen({required this.telepon});
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showPassword = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    // Dio dio = new Dio();

    // var coba = dio
    //     .get('https://rtq-freelance.my.id/api/info_profil/' + widget.telepon);

    print(widget.telepon);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTelepon = new TextEditingController();
    TextEditingController _controllerNama = new TextEditingController();

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
                            sizeBtn: 0,
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
                  reverse: true,
                  child: Column(
                    children: [
                      buildTextField(
                          "Nama", "Namamu", false, false, _controllerNama),
                      buildTextField(
                          "Nama", "Namamu", false, false, _controllerNama),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlineButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.black)),
                          ),
                          RaisedButton(
                            onPressed: () {
                              // print(_controllerTelepon.text);
                              // print(_controllerNama.text);
                            },
                            color: mainColor,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SAVE",
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
              )
            ],
          ),
        ),
      ),
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
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
