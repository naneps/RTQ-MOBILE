// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/services/remote_services.dart';

import 'package:tahfidz/views/pengajar/home/home_screen.dart';

import '../../components/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTelepon = TextEditingController();
    TextEditingController _controllerPassword = TextEditingController();

    final fieldTelepon = TextFormField(
      controller: _controllerTelepon,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Telepon",
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Telepon tidak boleh kosong';
        }
        return null;
      },
    );
    final fieldPassword = TextFormField(
      controller: _controllerPassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
    final loginText = Center(
        child: Text(
      "Masuk",
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    ));
    final loginButton = FlatButton(
      color: mainColor,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          RemoteServices.loginProses(_controllerTelepon, _controllerPassword);
        }
      },
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              // top: 0,

              child: Container(
                margin: EdgeInsets.only(top: 500),
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                // color: Color.fromARGB(255, 240, 238, 243),
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Container(
                      child: Lottie.asset('assets/splash.json'),
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "Rumah Tahfidz ",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              margin: EdgeInsets.only(top: 200, left: 50, right: 50),
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
                ],
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    loginText,
                    SizedBox(height: 35),
                    fieldTelepon,
                    SizedBox(height: 35),
                    fieldPassword,
                    SizedBox(height: 35),
                    loginButton,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendLoginFailed() {
    Fluttertoast.showToast(
        msg: "LOGIN GAGAL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
