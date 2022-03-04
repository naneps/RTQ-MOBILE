import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/pages/pengajar/home/home_screen.dart';

import 'model/profil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (SpUtil.getBool('status') != true)
          ? const MyAppPage()
          : const HomeScreen(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  Dio dio = new Dio();
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTelepon = new TextEditingController();
    TextEditingController _controllerPassword = new TextEditingController();

    Future<void> _loginProses() async {
      try {
        Response response;

        ProgressDialog? progressDialog = ProgressDialog(context);
        progressDialog.style(message: "Harap Tunggu...");
        progressDialog.show();

        response = await dio.post("http://rtq-freelance.my.id/api/login",
            data: FormData.fromMap({
              "no_hp": "${_controllerTelepon.text}",
              "password": "${_controllerPassword.text}",
            }));

        progressDialog.hide();

        if (response.data['status'] == true) {
          SpUtil.putBool("status", response.data['status']);
          SpUtil.putString("nama", response.data['data']['nama']);
          SpUtil.putString("keterangan", response.data['data']['keterangan']);
          SpUtil.putString("no_hp", response.data['data']['no_hp']);
          setState(() {
            _controllerTelepon.text = "";
            _controllerPassword.text = "";
          });

          Get.off(const HomeScreen());
        } else if (response.data['status'] == false) {
          sendLoginFailed();
        }
      } on DioError catch (e) {
        print(e);
      }
    }

    final fieldTelepon = TextFormField(
      controller: _controllerTelepon,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "Telepon",
          prefixIcon: const Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
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
        if (_controllerPassword.text == '' || _controllerTelepon.text == '') {
          sendLoginFailed();
        } else {
          _loginProses();
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
                margin: EdgeInsets.only(top: 400),
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
