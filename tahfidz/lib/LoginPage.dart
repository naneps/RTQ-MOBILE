// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tahfidz/pages/pengajar/home/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Dio dio = new Dio();
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTelepon = new TextEditingController();
    TextEditingController _controllerPassword = new TextEditingController();

    Future<void> _loginProses() async {
      try {
        Response response;

        response = await dio.post("http://rtq-freelance.my.id/api/login",
            data: FormData.fromMap({
              "no_hp": "${_controllerTelepon.text}",
              "password": "${_controllerPassword.text}",
            }));
        if (response.data['status'] == true) {
          setState(() {
            _controllerTelepon.text = "";
            _controllerPassword.text = "";
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          setState(() {
            sendLoginFailed();
          });
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    final fieldPassword = TextFormField(
      controller: _controllerPassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    final loginText = Center(
        child: Text(
      "Masuk",
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    ));
    final loginButton = FlatButton(
      color: Colors.deepPurple,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
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
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              // background: Color.fromARGB(255, 240, 238, 243),
              padding: EdgeInsets.all(40),
              child: Center(
                  child: Text(
                "Rumah Tahfidz",
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 400),
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                margin: EdgeInsets.only(top: 200, left: 50, right: 50),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0.1,
                          blurRadius: 5)
                    ]),
                child: Form(
                  child: ListView(
                    padding: EdgeInsets.all(30),
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
                ))
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
